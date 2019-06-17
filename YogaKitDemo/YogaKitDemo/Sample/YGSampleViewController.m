//
//  YGSampleViewController.m
//  YogaKitDemo
//
//  Created by tassel on 2019/6/17.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "YGSampleViewController.h"

@interface YGSampleViewController ()
@property (nonatomic, assign) YGSampleType type;
@end

@implementation YGSampleViewController

- (instancetype)initWithType:(YGSampleType)type {
    self = [super init];
    if (self) {
        self.type = type;
    }
  return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    YGSampleView *sampleView = [[YGSampleView alloc] initWithType:_type];
    [self.view addSubview:sampleView];
}


@end
