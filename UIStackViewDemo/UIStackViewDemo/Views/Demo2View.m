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
    bottomStackView.distribution = UIStackViewDistributionFill;
    bottomStackView.spacing = 10;
    [self addSubview:bottomStackView];

    [topStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.mas_equalTo(self);
        make.height.mas_equalTo(self).multipliedBy(0.7);
    }];
    [bottomStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topStackView.mas_bottom).offset(10);
        make.leading.mas_equalTo(self).offset(10);
        make.trailing.mas_equalTo(self).offset(-10);
    }];

    {
       //bottom subviews
        UIStackView *headStackView = [UIStackView new];
        headStackView.axis = UILayoutConstraintAxisHorizontal;
        headStackView.spacing = 50;
        headStackView.distribution = UIStackViewDistributionFillEqually;
        headStackView.alignment = UIStackViewAlignmentTop;
        
        {
            UILabel *textLabel = [UILabel new];
            textLabel.text = @"一只刚会走的宓珂璟";
            textLabel.textColor = UIColor.redColor;
            textLabel.numberOfLines = 0;
            textLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightSemibold];
            
            UIStackView *headSubStackView = [UIStackView new];
            headSubStackView.alignment = UIStackViewAlignmentFill;
            headSubStackView.distribution = UIStackViewDistributionFillEqually;
            headSubStackView.axis = UILayoutConstraintAxisHorizontal;
            headSubStackView.spacing = 30;
            
            UIButton *likeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            [likeBtn setTitle:@"点我喜欢" forState:UIControlStateNormal];
            
            UIButton *disLikeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            [disLikeBtn setTitle:@"我不喜欢" forState:UIControlStateNormal];
            
            [headSubStackView addArrangedSubview:likeBtn];
            [headSubStackView addArrangedSubview:disLikeBtn];
            
            [headStackView addArrangedSubview:textLabel];
            [headStackView addArrangedSubview:headSubStackView];
        }
        
        
        UILabel *desLabel = [UILabel new];
        desLabel.text = @"落霞与孤鹜齐飞，秋水共长天一色。渔舟唱晚，响穷彭蠡之滨，雁阵惊寒，声断衡阳之浦";
        desLabel.numberOfLines = 0;
        desLabel.textColor = [UIColor orangeColor];
        desLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightMedium];
        desLabel.textAlignment = NSTextAlignmentCenter;
        
        UIStackView *tailStackView = [UIStackView new];
        tailStackView.axis = UILayoutConstraintAxisHorizontal;
        tailStackView.spacing = 20;
        tailStackView.distribution = UIStackViewDistributionFillEqually;
        tailStackView.alignment = UIStackViewAlignmentFill;
        {
            UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
            leftButton.backgroundColor = [UIColor yellowColor];
            [leftButton setTitle:@"Left" forState:UIControlStateNormal];
            
            UIButton *centerButton = [UIButton buttonWithType:UIButtonTypeSystem];
            centerButton.backgroundColor = [UIColor redColor];
            [centerButton setTitle:@"Center" forState:UIControlStateNormal];
            
            UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
            rightButton.backgroundColor = [UIColor blueColor];
            [rightButton setTitle:@"Right" forState:UIControlStateNormal];
            
            
            [tailStackView addArrangedSubview:leftButton];
            [tailStackView addArrangedSubview:centerButton];
            [tailStackView addArrangedSubview:rightButton];
        }
        

        [bottomStackView addArrangedSubview:headStackView];
        [bottomStackView addArrangedSubview:desLabel];
        [bottomStackView addArrangedSubview:tailStackView];
        
    

    }
    

}

#pragma mark - getter

- (UIImageView *)imageView1 {
    if (!_imageView1) {
        _imageView1 = [UIImageView new];
        _imageView1.image = [UIImage imageNamed:@"1"];
        _imageView1.contentMode = UIViewContentModeScaleAspectFill;
        _imageView1.clipsToBounds = YES;

    }
    return _imageView1;
}

- (UIImageView *)imageView2 {
    if (!_imageView2) {
        _imageView2 = [UIImageView new];
        _imageView2.image = [UIImage imageNamed:@"2"];
        _imageView2.contentMode = UIViewContentModeScaleAspectFill;
        _imageView2.clipsToBounds = YES;
    }
    return _imageView2;
}

-(UIImageView *)imageView3 {
    if (!_imageView3) {
        _imageView3 = [UIImageView new];
        _imageView3.image = [UIImage imageNamed:@"3"];
        _imageView3.contentMode = UIViewContentModeScaleAspectFill;
        _imageView3.clipsToBounds = YES;

    }
    return _imageView3;
}

@end
