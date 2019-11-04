//
//  TSAudioPlayer.m
//  TSAudioPlayer
//
//  Created by tassel on 2019/11/4.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "TSAudioPlayer.h"
#import "NSTimer+EOCBlocksSupport.h"
@interface TSAudioPlayer()
/*播放状态*/
@property (nonatomic, readwrite) FSAudioStreamState state;
/*总时间*/
@property (nonatomic, copy)   NSString *totalTime;
@property (nonatomic, strong) NSTimer *refreshTimer;
@end

@implementation TSAudioPlayer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.state = kFsAudioStreamStopped;
    }
    return self;
}
#pragma mark - setter
- (void)setPlayUrlStr:(NSString *)playUrlStr {
    
    //  当前播放链接与传入链接一致
    if ([self.playUrlStr isEqualToString:playUrlStr]) {
        
        if (self.state == kFsAudioStreamPlaying) {

            return;
        }
        if (self.state == kFsAudioStreamPaused) {
            [self.audioStream play];
            return;
        }
        if (self.state == kFsAudioStreamBuffering) {
            return;
        }
    }
    
    _playUrlStr = playUrlStr;

    if (self.state == kFsAudioStreamPlaying) {
        [self stop];
    }
    
    NSURL *audioUrl = [NSURL URLWithString:playUrlStr];
    [self.audioStream playFromURL:audioUrl];
    
    @weakify(self)
    //  播放完成回调事件
    [self.audioStream setOnCompletion:^{
        NSLog(@"完成了");
        @strongify(self)
        if (self.delegate && [self.delegate respondsToSelector:@selector(audioPlayerDidPlayMusicCompleted)]) {
            [self.delegate audioPlayerDidPlayMusicCompleted];
        }
    }];
    
    [self.audioStream setOnStateChange:^(FSAudioStreamState state) {
        @strongify(self)
        self.state = state;
        if (self.delegate && [self.delegate respondsToSelector:@selector(audioPlayer:stateChange:)]) {
            [self.delegate audioPlayer:self stateChange:self.state];
        }
    }];
    
    
    self.audioStream.onFailure = ^(FSAudioStreamError error, NSString *errorDescription) {
        NSString *errorCategory;
        
        switch (error) {
            case kFsAudioStreamErrorOpen:
                errorCategory = @"Cannot open the audio stream: ";
                break;
            case kFsAudioStreamErrorStreamParse:
                errorCategory = @"Cannot read the audio stream: ";
                break;
            case kFsAudioStreamErrorNetwork:
                errorCategory = @"Network failed: cannot play the audio stream: ";
                break;
            case kFsAudioStreamErrorUnsupportedFormat:
                errorCategory = @"Unsupported format: ";
                break;
            case kFsAudioStreamErrorStreamBouncing:
                errorCategory = @"Network failed: cannot get enough data to play: ";
                break;
            default:
                errorCategory = @"Unknown error occurred: ";
                break;
        }
        
        NSString *formattedError = [NSString stringWithFormat:@"%@ %@", errorCategory, errorDescription];

        NSLog(@"%@", formattedError);
    };
}
- (void)setProgress:(CGFloat)progress {
    FSStreamPosition pos = {0};
    pos.position = progress;
    [self.audioStream seekToPosition:pos];
}
#pragma mark - public method
- (void)play {
    if (self.state == kFsAudioStreamStopped) {
        [self.audioStream play];
    }
    if (self.state == kFsAudioStreamPaused) {
        [self resume];
    }
}
- (void)pause {
    if (self.state == kFsAudioStreamPlaying) {
        [self.audioStream pause];
    }
}
- (void)resume {
    if (self.state == kFsAudioStreamPaused) {
        [self.audioStream pause];
    }
}
- (void)stop {
    if (self.state != kFsAudioStreamStopped) {
        [self.audioStream stop];
    }
}
- (void)removeVoice {
    [self.audioStream stop];
}
#pragma mark - private
- (void)addTimer {
    
    if ([self.refreshTimer isValid]) {
        return;
    }
    
    [self removeTimer];
    
    @weakify(self)
    
    self.refreshTimer = [NSTimer eoc_scheduledTimerWithTimeInterval:0.1 block:^{
        @strongify(self)
        [self updatePlaybackProgress];
    } repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:self.refreshTimer forMode:NSRunLoopCommonModes];
    
}
- (void)removeTimer {
    if (_refreshTimer == nil) {
           return;
       }
       if ([_refreshTimer isValid]) {
           [_refreshTimer invalidate];
       }
       _refreshTimer = nil;
}

- (void)updatePlaybackProgress {
    
    //  如果流是连续的（没有已知的持续时间），则该属性为真。
    if (self.audioStream.continuous) {

        if (self.delegate && [self.delegate respondsToSelector:@selector(audioPlayer:currentTime:totalTime:progress:)]) {
            [self.delegate audioPlayer:self currentTime:0 totalTime:0 progress:0];
        }
    } else {
        //  滑块 可以点击
        //  正在拖动滑块
//        if (self.isDraging == YES)  return;
 
        FSStreamPosition cur = self.audioStream.currentTimePlayed;
        FSStreamPosition end = self.audioStream.duration;
        
    
    
        if (self.delegate && [self.delegate respondsToSelector:@selector(audioPlayer:currentTime:totalTime:progress:)]) {
            [self.delegate audioPlayer:self currentTime:cur.playbackTimeInSeconds totalTime:end.playbackTimeInSeconds progress:cur.position];
        }
    }

    if (self.audioStream.contentLength > 0  ) {
        
        UInt64 totalBufferedData =  self.audioStream.prebufferedByteCount;
        float bufferedDataFromTotal = (float)totalBufferedData / self.audioStream.contentLength;
//        音频缓存进度
        if (self.delegate && [self.delegate respondsToSelector:@selector(audioPlayer:cacheProgress:)]) {
            [self.delegate audioPlayer:self cacheProgress:bufferedDataFromTotal];
        }
    } else {
        // A continuous stream, use the buffering indicator to show progress
        // among the filled prebuffer
//        缓存进度条进度刷新
        UInt64 totalBufferedData =  self.audioStream.prebufferedByteCount;
        CGFloat cacheValue =  (float)totalBufferedData / self.audioStream.configuration.maxPrebufferedByteCount;
        if (self.delegate && [self.delegate respondsToSelector:@selector(audioPlayer:cacheProgress:)]) {
            [self.delegate audioPlayer:self cacheProgress:cacheValue];
        }
    }
}
#pragma mark - getter
- (FSAudioStream *)audioStream {
    if (!_audioStream) {
        _audioStream = [[FSAudioStream alloc] init];
        _audioStream.strictContentTypeChecking = NO;
        _audioStream.defaultContentType = @"audio/mpeg";
    }
    return _audioStream;
}

- (BOOL)isPlaying {

    return self.audioStream.isPlaying;
}
@end
