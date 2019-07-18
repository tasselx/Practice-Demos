//
//  ViewController.m
//  GridMasnory
//
//  Created by tassel on 2019-07-18.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController()
@property (nonatomic, strong) UIView *contentView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupView];
}

- (void)setupView {

    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 300));
        make.center.mas_equalTo(self.view);
    }];
    
    UILabel *lastView = nil;
    CGFloat contentW = 300;
    CGFloat contentH = 300;
    CGFloat itemW = contentW/3.0;
    CGFloat itemH = contentH/3.0;
    NSInteger col = 3;
    for (NSInteger i=0; i<9;i++) {
        UILabel *itemView = [UILabel new];
        itemView.text = [NSString stringWithFormat:@"%ld",(long)i];
        itemView.textAlignment = NSTextAlignmentCenter;
        itemView.layer.borderWidth = 2;
        itemView.layer.borderColor = [UIColor cyanColor].CGColor;
        itemView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:itemView];
        
        [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(itemW, itemH));
            CGFloat top =  (NSInteger)(i/col)*itemH;//距上的位置
            make.top.mas_equalTo(top);
            //last不存在 或者 i%col= 0是换行了确定左边的位置
            if (!lastView || (i%col)==0) {
                make.leading.mas_equalTo(0);
            }else {
                //第二个或者后边的按钮距离前一个按钮的单位
                make.leading.mas_equalTo(lastView.mas_trailing);
            }
            
        }];
        
        lastView = itemView;
        
    }
}
- (UIView *)contentView {
    if (!_contentView){
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:_contentView];
    }
    return _contentView;
}

@end
