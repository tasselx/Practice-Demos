//
//  LoginView.m
//  LauchVideoDemo
//
//  Created by tassel on 2019/12/21.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "LoginView.h"
@interface LoginView()

@end

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame  {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
    titleLabel.center = self.center;
    titleLabel.text = @"Hello,World";
    titleLabel.font = [UIFont fontWithName:@"Helvetica-Oblique" size:28];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor blackColor];
    [self addSubview:titleLabel];
}
@end
