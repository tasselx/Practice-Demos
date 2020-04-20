//
//  OverlapView.m
//  UIStackViewDemo
//
//  Created by tassel on 2020/4/20.
//  Copyright © 2020 tassel. All rights reserved.
//

#import "OverlapView.h"
#import <Masonry/Masonry.h>

@interface OverlapView()
@property (nonatomic, strong) UIStackView *stackView;
@end

@implementation OverlapView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    
    [self addSubview:self.stackView];
    [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(250);
        make.centerX.mas_equalTo(self);
        make.height.mas_equalTo(50);
    }];
    
    for (NSInteger i=0; i<5; i++) {
        UIImageView *imgView = [UIImageView new];
        imgView.image = [UIImage imageNamed:@"images"];
        imgView.clipsToBounds = YES;
        imgView.layer.cornerRadius = 25;
        [self.stackView addArrangedSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
    }
    
}

- (UIStackView *)stackView {
    if (!_stackView) {
        _stackView = [UIStackView new];
        _stackView.spacing = -15;
        _stackView.axis = UILayoutConstraintAxisHorizontal;
        _stackView.alignment = UIStackViewAlignmentCenter;
        _stackView.distribution = UIStackViewDistributionFillEqually;
    }
    return _stackView;
}
@end
