//
//  ViewController.m
//  LauchVideoDemo
//
//  Created by tassel on 2019/12/21.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ViewController.h"
#import "LoginView.h"
#import <AVFoundation/AVFoundation.h>

#define kScreenWidth  CGRectGetWidth([UIScreen mainScreen].bounds)
#define kScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)
@interface ViewController ()
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) LoginView *loginView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupForAVplayerView];
    [self setupMaskView];
    
    _loginView = [[LoginView alloc]initWithFrame:self.view.bounds];
    _loginView.alpha = 0.f;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2.5f];
    _loginView.alpha = 1.0f;
    [UIView commitAnimations];
     [self.view addSubview:_loginView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playVideo) name:UIApplicationDidBecomeActiveNotification object:nil];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self playVideo];
}

- (void)playVideo {
    [self.player play];
}

- (void)setupForAVplayerView {
    
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.frame = self.view.bounds;
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:playerLayer];
}

- (void)setupMaskView {
    
    
    UIView *loginMaskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    loginMaskView.alpha = 0.8;
    [self.view addSubview:loginMaskView];
    
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,kScreenWidth,kScreenHeight);
    gl.startPoint = CGPointMake(0.5, 0);
    gl.endPoint = CGPointMake(0.5, 1);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:3/255.0 green:176/255.0 blue:159/255.0 alpha:0.08].CGColor, (__bridge id)[UIColor colorWithRed:3/255.0 green:176/255.0 blue:159/255.0 alpha:0.8].CGColor];
    gl.locations = @[@(0), @(1.0f)];
    
    [loginMaskView.layer addSublayer:gl];
    
}
- (AVPlayer *)player
{
    if (!_player) {
        AVPlayerItem *playerItem = [self getPlayItem];
        _player = [AVPlayer playerWithPlayerItem:playerItem];
        //设置重复播放
        _player.actionAtItemEnd = AVPlayerActionAtItemEndNone; // set this
        
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(runLoopTheMovie:)
                                                    name:AVPlayerItemDidPlayToEndTimeNotification
                                                  object:nil];
        
    }
    return _player;
}

- (void)runLoopTheMovie:(NSNotification *)sender
{
    [_player seekToTime:kCMTimeZero]; // seek to zero
}

- (AVPlayerItem *)getPlayItem {
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"login" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
    return playerItem;
}

@end
