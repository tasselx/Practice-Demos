//
//  ViewController.m
//  intrinsicDemo
//
//  Created by tassel on 2019/6/30.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "IntrinsicView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    IntrinsicView *intrinsicView = [IntrinsicView new];
    intrinsicView.backgroundColor = [UIColor redColor];
    intrinsicView.content = @"岁月沉默，秋风厌倦瓢泼";
    [self.view addSubview:intrinsicView];
    
    [intrinsicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
    }];
}


@end
