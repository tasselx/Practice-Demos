//
//  ViewController.m
//  TSAudioPlayer
//
//  Created by tassel on 2019/11/4.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ViewController.h"
#import "TSAudioPlayer.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TSAudioPlayer *player = [TSAudioPlayer new];
    player.playUrlStr = @"http://dl.stream.qqmusic.qq.com/M500003z2Qj63Uf5rD.mp3?vkey=C4CCCA44FBE63BED8CFD2E828CF520581E9031EA2081BB61B6A59C019134974C5B3EC655616BC35F796F3B3876D6B8658F77598FA8F9D253&uin=0&fromtag=8&guid=7332953645";
}


@end
