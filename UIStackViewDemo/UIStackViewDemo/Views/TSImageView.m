//
//  TSImageView.m
//  UIStackViewDemo
//
//  Created by tassel on 2020/4/21.
//  Copyright © 2020 tassel. All rights reserved.
//

#import "TSImageView.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/SDWebImage.h>
@interface TSImageView()
@property (nonatomic, strong) UIStackView   *stackView;
@property (nonatomic, strong) UIImageView   *imgView;
@property (nonatomic, strong) UILabel       *textLabel;
@end

@implementation TSImageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    [self addSubview:self.stackView];
    
    [self.stackView addArrangedSubview:self.imgView];
    [self.stackView addArrangedSubview:self.textLabel];
    
    [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
//        make.width.lessThanOrEqualTo(self).offset(-20);
    }];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(40);
        make.width.mas_equalTo(self.imgView.mas_height);
    }];

    
}
#pragma mark -
- (UIStackView *)stackView {
    if (!_stackView) {
        _stackView = [UIStackView new];
        _stackView.axis = UILayoutConstraintAxisVertical;
        _stackView.distribution = UIStackViewDistributionFill;
        _stackView.alignment = UIStackViewAlignmentCenter;
        _stackView.spacing = 5;
    }
    return _stackView;
}
- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
        _imgView.backgroundColor = [self rndColor];
        [_imgView sd_setImageWithURL:[NSURL URLWithString:@"http://thirdwx.qlogo.cn/mmopen/vi_32/TQRoibX72mRxIkvv65X62iam2Pv48UkrFRWc2AFo9hReRNJvV8R1R9LImDza1sYcanqjibR52DLictEmBicibibf3CeXw/132"]];
    }
    return _imgView;
}
- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [UILabel new];
        _textLabel.font = [UIFont systemFontOfSize:15];
        _textLabel.text = @"美食";
        
    }
    return _textLabel;
}
- (UIColor *)rndColor{
    return [UIColor colorWithRed:rand()%256/255.0 green:rand()%256/255.0 blue:rand()%256/255.0 alpha:1];
}
@end
