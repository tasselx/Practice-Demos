//
//  IntrinsicView.m
//  intrinsicDemo
//
//  Created by tassel on 2019/6/30.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "IntrinsicView.h"
#import "Masonry.h"
@interface IntrinsicView()
@property (nonatomic,strong) UILabel *contentLabel;
@end
@implementation IntrinsicView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}
- (void)setupViews {
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
}
- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.textColor = [UIColor whiteColor];
        [self addSubview:_contentLabel];
    }
    return _contentLabel;
}
- (void)setContent:(NSString *)content {
    _content = content;
    self.contentLabel.text = content;
}
- (CGSize)intrinsicContentSize {
    CGSize size = [self.contentLabel intrinsicContentSize];
    if ([self.contentLabel.text length] > 0) {
        size.width += 10;
        size.height += 10;
    }
    
    return size;
  
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
