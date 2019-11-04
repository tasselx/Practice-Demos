//
//  TSAudioPlayer.h
//  TSAudioPlayer
//
//  Created by tassel on 2019/11/4.
//  Copyright © 2019 tassel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSAudioStream.h"
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@class TSAudioPlayer;
@protocol TSAudioPlayerDelegate <NSObject>

@optional
/* 播放完成 */
- (void)audioPlayerDidPlayMusicCompleted;
/* 播放状态 */
- (void)audioPlayer:(TSAudioPlayer *)player stateChange:(FSAudioStreamState)state;
/* 播放进度 */
- (void)audioPlayer:(TSAudioPlayer *)player currentTime:(CGFloat)currentTime totalTime:(CGFloat)totalTime progress:(CGFloat)progress;
/* 缓存进度 */
- (void)audioPlayer:(TSAudioPlayer *)player cacheProgress:(CGFloat)cacheProgress;
@end

@interface TSAudioPlayer : NSObject

@property (nonatomic, weak) id<TSAudioPlayerDelegate> delegate;
@property (nonatomic, copy) NSString *playUrlStr;
@property (nonatomic, readonly) FSAudioStreamState state;
@property (nonatomic, assign) CGFloat progress;//设置播放进度
@property (nonatomic, assign) BOOL   isPlaying;
/* AudioStream 播放器*/
@property (nonatomic, strong) FSAudioStream *audioStream;

- (void)play;

- (void)pause;

- (void)resume;

- (void)stop;

- (void)removeVoice;

- (void)addTimer;
- (void)removeTimer;
@end

NS_ASSUME_NONNULL_END
