//
//  PTPageControl.m
//  PageControl
//
//  Created by tassel on 2019/6/28.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "PTPageControl.h"

#define kCurrentPageW  12
#define kCurrentPageH  4
#define kPageW         6
#define kPageH         4
#define kPageSpaceW    4
@interface PTPageControl() {
    
}


@property (nonatomic,strong) UIView    *currentPageView;
@property (nonatomic,assign) NSInteger currentIndex;
@property (nonatomic,strong) NSMutableArray *pages;
@property (nonatomic,strong) UIColor  *normalPageColor;
@property (nonatomic,strong) UIColor  *currentPageColor;
@property (nonatomic,assign) CGRect   superFrame;
@end
@implementation PTPageControl

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.superFrame = frame;
        self.currentIndex = 0;
        self.pages = [NSMutableArray array];
    }
    return self;
}
- (void)setCurrentPage:(NSInteger)index {
    _currentPage = index;
    
    if (index == self.currentIndex || index < 0 || index >= self.count) {
        return;
    }
    
    UIView * currentPage = self.currentPageView;
    UIView * exchangeDot = [self.pages objectAtIndex:index];
    if (index > self.currentIndex) {
        [UIView animateWithDuration:0.2 animations:^{
            CGPoint currentPoint = currentPage.center;
            currentPage.center = CGPointMake(exchangeDot.center.x - kPageW/2, exchangeDot.center.y);
            for (NSInteger i = self.currentIndex + 1; i <= index; i ++) {
                UIView * dot = [self.pages objectAtIndex:i];
                
                dot.center = CGPointMake(dot.center.x - kPageSpaceW-kCurrentPageW, currentPoint.y);
            }
        }];
        
    }
    else{
        [UIView animateWithDuration:0.2 animations:^{
            CGPoint currentPoint = currentPage.center;
            currentPage.center = CGPointMake(exchangeDot.center.x + kPageW/2, exchangeDot.center.y);
            for (NSInteger i = index; i < self.currentIndex; i ++) {
                UIView * dot = [self.pages objectAtIndex:i];
                dot.center = CGPointMake(dot.center.x + kPageSpaceW+kCurrentPageW, currentPoint.y);
            }
        }];
    }
    
    [self.pages removeObjectAtIndex:self.currentIndex];
    [self.pages insertObject:self.currentPageView atIndex:index];
    self.currentIndex = index;
}


- (void)setHidesForSinglePage:(BOOL)hidesForSinglePage {
    
    _hidesForSinglePage = hidesForSinglePage;
    self.hidden = hidesForSinglePage;
}

- (void)setupUI {
    
    self.backgroundColor = [UIColor clearColor];
    self.normalPageColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    self.currentPageColor = [UIColor whiteColor];
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.pages removeAllObjects];
    CGRect rect = self.superFrame;
    rect.size = CGSizeMake((kPageW+kPageSpaceW)*(self.count+1), kPageH);
    rect.origin.x = (self.superFrame.size.width-rect.size.width)/2;
    self.frame = rect;
    
    [self.pages addObject:self.currentPageView];
    [self addSubview:self.currentPageView];
    
    // normalPage
    for (int i = 0; i < self.count - 1; i ++) {
        CGFloat X = (kPageW+kPageSpaceW) * (i + 2);
        
        UIView *normalPageView  =  [UIView new];
        normalPageView.frame = CGRectMake(X, 0, kPageW, kPageH);
        normalPageView.layer.cornerRadius = kPageH/2.0;
        normalPageView.backgroundColor = [UIColor whiteColor];
        normalPageView.alpha = 0.5;

        [self addSubview:normalPageView];
        [self.pages addObject:normalPageView];
    }
}

-(void)setCount:(NSInteger)count {
    _count = count;
    [self setupUI];
    
}
- (UIView *)currentPageView{
    if (!_currentPageView) {
        _currentPageView = [UIView new];
        _currentPageView.frame = CGRectMake(kPageSpaceW, 0, kCurrentPageW, kCurrentPageH);
        _currentPageView.layer.cornerRadius = kCurrentPageH/2.0;
        _currentPageView.backgroundColor = [UIColor whiteColor];
  
    }
    return _currentPageView;
}
@end
