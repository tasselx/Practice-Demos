//
//  Demo4View.m
//  UIStackViewDemo
//
//  Created by tassel on 2020/4/20.
//  Copyright © 2020 tassel. All rights reserved.
//

#import "Demo4View.h"
#import <Masonry/Masonry.h>

@interface Demo4View()
@property (nonatomic, strong) UIStackView *stackView;
@property (nonatomic, strong) UIView      *redView;
@property (nonatomic, strong) UIView      *greenView;
@property (nonatomic, strong) UIView      *blueView;
@end

@implementation Demo4View

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    
    [self addSubview:self.stackView];
    
    self.redView = [UIView new];
    _redView.backgroundColor = [UIColor redColor];
    [self.stackView addArrangedSubview:_redView];
    
    self.greenView = [UIView new];
    _greenView.backgroundColor = [UIColor greenColor];
    [self.stackView addArrangedSubview:_greenView];
    
    self.blueView = [UIView new];
    _blueView.backgroundColor = [UIColor blueColor];
    [self.stackView addArrangedSubview:_blueView];
    
    
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
        
    [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(250);
        make.trailing.mas_equalTo(self).offset(-20);
        make.height.mas_equalTo(50);
    }];
}
- (UIStackView *)stackView {
    if (!_stackView) {
        _stackView = [UIStackView new];
        _stackView.spacing = 30;
        _stackView.axis = UILayoutConstraintAxisHorizontal;
        _stackView.alignment = UIStackViewAlignmentBottom;
        _stackView.distribution = UIStackViewDistributionEqualSpacing;
    }
    return _stackView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    self.blueView.hidden = YES;
}
@end
