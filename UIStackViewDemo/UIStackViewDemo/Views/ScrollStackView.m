//
//  ScrollStackView.m
//  UIStackViewDemo
//
//  Created by tassel on 2020/4/20.
//  Copyright © 2020 tassel. All rights reserved.
//

#import "ScrollStackView.h"
#import <Masonry/Masonry.h>
@interface ScrollStackView()
@property (nonatomic, strong) UIStackView  *stackView;
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation ScrollStackView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    
    self.scrollView = [UIScrollView new];
    [self addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    self.stackView = [UIStackView new];
    _stackView.axis = UILayoutConstraintAxisVertical;
    [self.scrollView addSubview:_stackView];
    
    [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.scrollView);
        make.bottom.mas_equalTo(self.scrollView);
        make.left.mas_equalTo(self.scrollView);
        make.right.mas_equalTo(self.scrollView);
    }];
    
    for (NSInteger i=0; i<100; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:[NSString stringWithFormat:@"Button %ld",(long)i] forState:UIControlStateNormal];
        [self.stackView addArrangedSubview:btn];
        btn.backgroundColor = [self rndColor];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(100);
            make.width.mas_equalTo(self);
        }];
    }
}
- (UIColor *)rndColor{
    return [UIColor colorWithRed:rand()%256/255.0 green:rand()%256/255.0 blue:rand()%256/255.0 alpha:1];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.scrollView.contentSize = CGSizeMake(self.stackView.frame.size.width, self.stackView.frame.size.height);
}
@end
