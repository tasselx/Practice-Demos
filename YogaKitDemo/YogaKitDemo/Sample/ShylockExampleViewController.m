//
//  ExampleViewController.m
//  YogaKitDemo
//
//  Created by tassel on 2019/6/17.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ShylockExampleViewController.h"
#import "UIView+Yoga.h"
#import "ShowModel.h"

static NSString *const showCellIdentifier = @"ShowCell";

@interface ShylockExampleViewController ()

@property (nonatomic, assign) CGFloat paddingHorizontal;
@property (nonatomic, assign) CGFloat padding;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIImageView *episodeImageView;
@property (nonatomic, strong) NSArray<ShowModel *> *shows;
@property (nonatomic, strong) UIScrollView *contentView;

@property (nonatomic, assign) NSInteger showPopularity;
@property (nonatomic, copy)   NSString  *showYear;
@property (nonatomic, copy)   NSString  *showRating;
@property (nonatomic, copy)   NSString  *showLength;
@property (nonatomic, copy)   NSString  *showCast;
@property (nonatomic, copy)   NSString  *showCreators;

@property (nonatomic, assign) NSInteger showSelectedIndex;
@property (nonatomic, copy)   NSString  *selectedShowSeriesLabel;
@property (nonatomic, strong) ShowModel *show;
@end

@implementation ShylockExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.contentView = [[UIScrollView alloc] initWithFrame:CGRectZero];
//    self.shows = [ShowModel loadShows];
//    self.show = _shows[self.showSelectedIndex];
//
//    _contentView.backgroundColor = self.backgroundColor;
//    [_contentView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//        layout.height = YGPointValue(self.view.bounds.size.height);
//        layout.width = YGPointValue(self.view.bounds.size.width);
//        layout.justifyContent = YGJustifyFlexStart;
//    }];
//    [self.view addSubview:_contentView];
//
//
//    [self setupViews];
}

- (void)setupViews {
    self.episodeImageView = [UIImageView new];
    _episodeImageView.backgroundColor = [UIColor grayColor];
    UIImage *image = [UIImage imageNamed:_show.image];
    _episodeImageView.image = image;
    CGFloat imageWidth = image.size.width?:1.0;
    CGFloat imageHeight = image.size.height?:1.0;
    [_episodeImageView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 1;
        layout.aspectRatio = imageWidth/imageHeight;
    }];
    [_contentView addSubview:_episodeImageView];
    
    [_contentView.yoga applyLayoutPreservingOrigin:NO];


}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect contentViewRect = CGRectZero;
    for (UIView *view in self.contentView.subviews) {
        contentViewRect = CGRectUnion(contentViewRect, view.frame);
    }
    self.contentView.contentSize = contentViewRect.size;
}
#pragma mark - Private methods
- (UILabel *)showLabelFor:(NSString *)text {
    UILabel *label = [UILabel new];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor lightGrayColor];
    label.text = text;
    [label configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginBottom = YGPointValue(5.0);
    }];
    return label;
}
#pragma mark - getter
- (UIImageView *)episodeImageView {
    if(!_episodeImageView) {
        
    }
    return _episodeImageView;
}

@end
