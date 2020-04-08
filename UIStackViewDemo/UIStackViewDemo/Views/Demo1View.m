//
//  Demo1View.m
//  UIStackViewDemo
//
//  Created by tassel on 2020/4/3.
//  Copyright © 2020 tassel. All rights reserved.
//

#import <Masonry/Masonry.h>
#import <BlocksKit/BlocksKit+UIKit.h>
#import <YYCategories/YYCategoriesMacro.h>
#import "Demo1View.h"
@interface Demo1View()
@property  (nonatomic, assign) NSInteger starCount;
@property  (nonatomic, strong) UIStackView *bottomStackView;
@end

@implementation Demo1View

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {

    UILabel *textLabel = [UILabel new];
    textLabel.text = @"How do you like this App";
    textLabel.textAlignment = NSTextAlignmentCenter;
    UIImageView *imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = [UIImage imageNamed:@"180x180"];

    UIStackView *topSubStackView = [UIStackView new];
    topSubStackView.axis = UILayoutConstraintAxisHorizontal;
    topSubStackView.distribution = UIStackViewDistributionFillEqually;
    topSubStackView.alignment = UIStackViewAlignmentCenter;

    UIButton *removeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [removeButton setTitle:@"Remove" forState:UIControlStateNormal];

    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [addButton setTitle:@"Add" forState:UIControlStateNormal];

    [topSubStackView addArrangedSubview:removeButton];
    [topSubStackView addArrangedSubview:addButton];

    UIStackView *topStackView = [[UIStackView alloc] initWithArrangedSubviews:@[textLabel,imageView,topSubStackView]];
    topStackView.axis = UILayoutConstraintAxisVertical;
    topStackView.alignment = UIStackViewAlignmentFill;
    topStackView.distribution = UIStackViewDistributionFillEqually;
    [self addSubview:topStackView];
    [topStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.mas_equalTo(self);
        make.height.mas_equalTo(self).multipliedBy(0.7);
    }];

    self.bottomStackView = [UIStackView new];
    _bottomStackView.axis = UILayoutConstraintAxisHorizontal;
    _bottomStackView.alignment = UIStackViewAlignmentCenter;
    _bottomStackView.distribution = UIStackViewDistributionFillEqually;
    _bottomStackView.spacing = 10;
    [self addSubview:_bottomStackView];
    [_bottomStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self);
        make.leading.mas_equalTo(self).offset(100);
        make.trailing.mas_equalTo(self).offset(-100);
        make.top.mas_equalTo(topStackView.mas_bottom);
    }];

    for (int i = 0; i <5; i++) {
        UIImageView *iconImagView = [UIImageView new];
        iconImagView.image = [UIImage imageNamed:@"score_hl"];
        iconImagView.tag = i+1;
        iconImagView.contentMode = UIViewContentModeScaleAspectFit;
        [_bottomStackView addArrangedSubview:iconImagView];
        iconImagView.hidden = YES;
    }

    @weakify(self)
    [addButton bk_addEventHandler:^(id sender) {
        @strongify(self)
        [self addStar:nil];
    } forControlEvents:UIControlEventTouchUpInside];


    [removeButton bk_addEventHandler:^(id sender) {
        @strongify(self)
        [self removeStar:nil];
    } forControlEvents:UIControlEventTouchUpInside];
}

- (void)removeStar:(id)sender
{
    if (self.starCount == 0) {
        return;
    }
    switch (self.starCount) {
        case 1: {
            UIImageView *imageView = [self.bottomStackView viewWithTag:1];
            imageView.hidden = YES;
            self.starCount = 0;
            break;
        }

        case 2: {
            UIImageView *imageView = [self.bottomStackView viewWithTag:2];
            imageView.hidden = YES;
            self.starCount = 1;
            break;
        }
        case 3: {
            UIImageView *imageView = [self.bottomStackView viewWithTag:3];
            imageView.hidden = YES;
            self.starCount = 2;
            break;
        }

        case 4: {
            UIImageView *imageView = [self.bottomStackView viewWithTag:4];
            imageView.hidden = YES;
            self.starCount = 3;
            break;
        }

        case 5: {
            UIImageView *imageView = [self.bottomStackView viewWithTag:5];
            imageView.hidden = YES;
            self.starCount = 4;
            break;
        }
        default:
            break;
    }

}
- (void)addStar:(id)sender
{
    if (self.starCount == 5) {
        return;
    }
    switch (self.starCount) {
        case 0: {
            UIImageView *imageView = [self.bottomStackView viewWithTag:1];
            imageView.hidden = NO;
            self.starCount = 1;
            break;
        }

        case 1: {
            UIImageView *imageView = [self.bottomStackView viewWithTag:2];
            imageView.hidden = NO;
            self.starCount = 2;
            break;
        }
        case 2: {
            UIImageView *imageView = [self.bottomStackView viewWithTag:3];
            imageView.hidden = NO;
            self.starCount = 3;
            break;
        }
        case 3: {
            UIImageView *imageView = [self.bottomStackView viewWithTag:4];
            imageView.hidden = NO;
            self.starCount = 4;
            break;
        }

        case 4: {
            UIImageView *imageView = [self.bottomStackView viewWithTag:5];
            imageView.hidden = NO;
            self.starCount = 5;
            break;
        }

        default:
            break;
    }
}

@end
