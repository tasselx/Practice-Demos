//
//  VerticalView.m
//  UIStackViewDemo
//
//  Created by tassel on 2020/4/20.
//  Copyright © 2020 tassel. All rights reserved.
//

#import "VerticalView.h"
#import <Masonry/Masonry.h>

@interface VerticalView()
@property (nonatomic, strong) UIStackView *stackView;
@end

@implementation VerticalView

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
        make.edges.mas_equalTo(self);
    }];
    for (NSInteger i=0; i<4; i++) {
        UIView *view = [UIView new];
        view.backgroundColor = [self rndColor];
        [self.stackView addArrangedSubview:view];
    }
}
- (UIStackView *)stackView {
    if (!_stackView) {
        _stackView = [UIStackView new];
        _stackView.axis = UILayoutConstraintAxisVertical;
        _stackView.distribution = UIStackViewDistributionFillEqually;
        _stackView.alignment = UIStackViewAlignmentFill;
    }
    return _stackView;
}
- (UIColor *)rndColor{
    return [UIColor colorWithRed:rand()%256/255.0 green:rand()%256/255.0 blue:rand()%256/255.0 alpha:1];
}
@end
