//
//  ViewController.m
//  LottieDemo
//
//  Created by tassel on 2019/6/26.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ViewController.h"
#import <Lottie/Lottie.h>

@interface ViewController ()
@property (nonatomic, strong) LOTAnimationView *lottieView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.lottieView];
    self.lottieView.frame = CGRectMake(100, 100, 17, 17);
    [self.lottieView play];
}

- (LOTAnimationView *)lottieView {
    if (!_lottieView) {
        _lottieView  = [LOTAnimationView animationNamed:@"zi"];
        _lottieView.loopAnimation = 1;
    }
    return _lottieView;
}

@end
