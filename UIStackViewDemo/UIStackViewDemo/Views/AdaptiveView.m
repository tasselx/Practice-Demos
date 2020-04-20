//
//  AdaptiveView.m
//  UIStackViewDemo
//
//  Created by tassel on 2020/4/20.
//  Copyright © 2020 tassel. All rights reserved.
//

#import "AdaptiveView.h"
#import <Masonry/Masonry.h>

@interface AdaptiveView()
@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UILabel *bottomLabel;
@property (nonatomic, strong) UIStackView *stackView;
@end

@implementation AdaptiveView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}
- (void)setupViews {
    
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [self addSubview:redView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.width.mas_equalTo(100);
    }];
    
    [redView addSubview:self.stackView];
    
    [self.stackView addArrangedSubview:self.topLabel];
    [self.stackView addArrangedSubview:self.bottomLabel];
    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.stackView);
    }];
    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.stackView);
    }];
    
    [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(20, 10, 30, 10));
    }];
    
}

- (UILabel *)topLabel {
    if (!_topLabel) {
        _topLabel = [UILabel new];
        _topLabel.text = @"top Label 长长长长长长长长长长长长长长长长长长长长长长长长长长长长";
        _topLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
        _topLabel.numberOfLines = 0;
        _topLabel.backgroundColor = [UIColor greenColor];
    }
    return _topLabel;
}
- (UILabel *)bottomLabel {
    if (!_bottomLabel) {
        _bottomLabel = [UILabel new];
        _bottomLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightMedium];
        _bottomLabel.text = @"短Label";
        _bottomLabel.numberOfLines = 0;
        _bottomLabel.backgroundColor = [UIColor orangeColor];
    }
    return _bottomLabel;
}
- (UIStackView *)stackView {
    if (!_stackView) {
        _stackView = [UIStackView new];
        _stackView.axis = UILayoutConstraintAxisVertical;
        _stackView.spacing = 10;
        _stackView.alignment = UIStackViewAlignmentCenter;
        _stackView.distribution = UIStackViewDistributionFill;
    }
    return _stackView;
}
@end
