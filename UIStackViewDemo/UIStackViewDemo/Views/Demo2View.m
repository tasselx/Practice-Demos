//
// Created by tassel on 2020/4/3.
// Copyright (c) 2020 tassel. All rights reserved.
//

#import <Masonry/Masonry.h>
#import "Demo2View.h"

@interface Demo2View()
@property  (nonatomic, strong) UIImageView *imageView1;
@property  (nonatomic, strong) UIImageView *imageView2;
@property  (nonatomic, strong) UIImageView *imageView3;
@end

@implementation Demo2View

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI {

    UIStackView *topStackView = [[UIStackView alloc] initWithArrangedSubviews:@[self.imageView1,self.imageView2,self.imageView3]];
    topStackView.axis = UILayoutConstraintAxisHorizontal;
    topStackView.spacing = 10;
    topStackView.alignment = UIStackViewAlignmentFill;
    topStackView.distribution = UIStackViewDistributionFillEqually;
    [self addSubview:topStackView];


    UIStackView *bottomStackView = [UIStackView new];
    bottomStackView.axis = UILayoutConstraintAxisVertical;
    bottomStackView.alignment = UIStackViewAlignmentFill;
    bottomStackView.distribution = UIStackViewDistributionFillEqually;
    [self addSubview:bottomStackView];

    [topStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.mas_equalTo(self);
        make.height.mas_equalTo(self).multipliedBy(0.7);
    }];
    [bottomStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.mas_equalTo(self);
        make.top.mas_equalTo(topStackView.mas_bottom).offset(10);
    }];


}

#pragma mark - getter

- (UIImageView *)imageView1 {
    if (!_imageView1) {
        _imageView1 = [UIImageView new];
        _imageView1.image = [UIImage imageNamed:@"1"];
        _imageView1.contentMode = UIViewContentModeScaleAspectFill;

    }
    return _imageView1;
}

- (UIImageView *)imageView2 {
    if (!_imageView2) {
        _imageView2 = [UIImageView new];
        _imageView2.image = [UIImage imageNamed:@"2"];
        _imageView2.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageView2;
}

-(UIImageView *)imageView3 {
    if (!_imageView3) {
        _imageView3 = [UIImageView new];
        _imageView3.image = [UIImage imageNamed:@"3"];
        _imageView3.contentMode = UIViewContentModeScaleAspectFill;

    }
    return _imageView3;
}

@end
