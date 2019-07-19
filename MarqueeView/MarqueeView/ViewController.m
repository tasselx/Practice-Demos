//
//  ViewController.m
//  MarqueeView
//
//  Created by tassel on 2019/7/19.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ViewController.h"
#import "PTMarqueeView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PTMarqueeView *marqueeView = [[PTMarqueeView alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    marqueeView.backgroundColor = [UIColor redColor];
    UILabel *textLabel = [UILabel new];
    textLabel.text = @"众里寻他千百度 蓦然回首 那人却在灯火阑珊处";
    textLabel.textColor = [UIColor whiteColor];
    
    marqueeView.contentView = textLabel;
    marqueeView.center = self.view.center;
    [self.view addSubview:marqueeView];
    
    
    // Do any additional setup after loading the view.
}


@end
