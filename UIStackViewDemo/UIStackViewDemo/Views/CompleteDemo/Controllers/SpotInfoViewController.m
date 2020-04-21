//
//  SpotInfoViewController.m
//  UIStackViewDemo
//
//  Created by tassel on 2020/4/21.
//  Copyright © 2020 tassel. All rights reserved.
//

#import "SpotInfoViewController.h"
#import <Masonry/Masonry.h>

@interface SpotInfoViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView       *contentView;
@end

@implementation SpotInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.contentView];

    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self.view);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.scrollView);
    }];
    
    UIStackView *contentStackView = [UIStackView new];
    contentStackView.axis = UILayoutConstraintAxisVertical;
    contentStackView.distribution = UIStackViewDistributionFill;
    contentStackView.alignment = UIStackViewAlignmentFill;
    contentStackView.spacing = 20;
    [self.contentView addSubview:contentStackView];
    
    [contentStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self.contentView);
    }];
}
#pragma mark -
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
    }
    return _scrollView;
}
- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor whiteColor];
        
    }
    return _contentView;
}
@end
