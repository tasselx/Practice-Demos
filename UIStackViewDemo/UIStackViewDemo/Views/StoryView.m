//
//  StoryView.m
//  UIStackViewDemo
//
//  Created by tassel on 2020/4/2.
//  Copyright © 2020 tassel. All rights reserved.
//

#import "StoryView.h"
#import <Masonry/Masonry.h>

@implementation StoryView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    UIView *hostView = [UIView new];
    hostView.backgroundColor = UIColor.whiteColor;
    
    
    UILabel *headerLabel = [UILabel new];
    headerLabel.numberOfLines = 0;
    headerLabel.translatesAutoresizingMaskIntoConstraints = NO;
    headerLabel.text = @"This is an info text shown on top of the image. The info text should inform the reader about the topic.";
    
    UIStackView *topStackView = [UIStackView new];
    [topStackView addArrangedSubview:headerLabel];
    
    UIImage *image = [UIImage imageNamed:@"header"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.backgroundColor = [UIColor yellowColor];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UILabel *bottomLabel = [UILabel new];
    bottomLabel.numberOfLines = 0;
    bottomLabel.text = @"This is the story text. It is interessting and shows a lot insight to the topic. The reader should be eager to read it and at the end he/she would be able to share with friends and family.";
    
    UIStackView *bottomStackView = [[UIStackView alloc] initWithArrangedSubviews:@[bottomLabel]];
    
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[topStackView,imageView,bottomStackView]];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.spacing = 10;
    
    
    [self addSubview:hostView];
    [hostView addSubview:stackView];
    
    [hostView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.mas_equalTo(hostView);
    }];
    [topStackView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(topStackView).offset(10);
        make.trailing.mas_equalTo(topStackView).offset(-10);
    }];
    CGSize imageSize = image.size;
    CGFloat height = [UIScreen mainScreen].bounds.size.width * imageSize.height/ imageSize.width;
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(height);
    }];
    [bottomLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(bottomStackView).offset(10);
        make.trailing.mas_equalTo(bottomStackView).offset(-10);
    }];
    
}

@end
