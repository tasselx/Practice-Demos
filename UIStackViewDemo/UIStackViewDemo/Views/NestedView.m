//
//  NestedView.m
//  UIStackViewDemo
//
//  Created by tassel on 2020/4/21.
//  Copyright © 2020 tassel. All rights reserved.
//

#import "NestedView.h"
#import <Masonry/Masonry.h>
#import "TSImageView.h"
@interface NestedView()
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIScrollView  *scrollView;
@property (nonatomic, strong) UIStackView   *stackView;
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation NestedView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    [self addSubview:self.contentView];
    [self.contentView addSubview:self.scrollView];
    [self.contentView addSubview:self.pageControl];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.mas_equalTo(self);
        make.height.mas_equalTo(180);
    }];
    
    [self.scrollView addSubview:self.stackView];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(10);
        make.leading.mas_equalTo(self.contentView);
        make.trailing.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView).offset(-20);
        make.centerX.mas_equalTo(self.pageControl);
    }];
    
    [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.scrollView);
        make.width.mas_equalTo(self.scrollView.mas_width).multipliedBy(3);
        make.top.bottom.mas_equalTo(self.scrollView);
        make.height.mas_equalTo(self.scrollView);
    }];
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(self.contentView).offset(-6);
    }];
    
    
    for (NSInteger i = 0; i<3; i++) {
        UIStackView *subStackView = [UIStackView new];
        subStackView.axis = UILayoutConstraintAxisVertical;
        subStackView.alignment = UIStackViewAlignmentFill;
        subStackView.distribution = UIStackViewDistributionFillEqually;
        
        UIStackView *topStackView = [UIStackView new];
        topStackView.axis = UILayoutConstraintAxisHorizontal;
        topStackView.alignment = UIStackViewAlignmentFill;
        topStackView.distribution = UIStackViewDistributionFillEqually;
        
        UIStackView *bottomStackView = [UIStackView new];
        bottomStackView.axis = UILayoutConstraintAxisHorizontal;
        bottomStackView.alignment = UIStackViewAlignmentFill;
        bottomStackView.distribution = UIStackViewDistributionFillEqually;
        
        
        for (NSInteger j = 0; j<5; j++) {
            TSImageView *imgView = [TSImageView new];
            
            [topStackView addArrangedSubview:imgView];
        }
        for (NSInteger j = 0; j<5; j++) {
            TSImageView *imgView = [TSImageView new];
            [bottomStackView addArrangedSubview:imgView];
        }
        
        [subStackView addArrangedSubview:topStackView];
        [subStackView addArrangedSubview:bottomStackView];
        [self.stackView addArrangedSubview:subStackView];
    }
}
#pragma mark -
- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor cyanColor];
    }
    return _contentView;
}
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}
- (UIStackView *)stackView {
    if (!_stackView) {
        _stackView = [UIStackView new];
        _stackView.axis = UILayoutConstraintAxisHorizontal;
        _stackView.alignment = UIStackViewAlignmentFill;
        _stackView.distribution = UIStackViewDistributionFillEqually;
        _stackView.spacing = 0;
    }
    return _stackView;
}
- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [UIPageControl new];
        _pageControl.numberOfPages = 3;
        _pageControl.currentPage = 0;
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    }
    return _pageControl;
}
@end
