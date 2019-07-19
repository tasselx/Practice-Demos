//
//  PTMarqueeView.h
//  PTMarqueeView
//
//  Created by tassel on 2019/7/10.
//  Copyright © 2019 tassel. All rights reserved.
//

#import <UIKit/UIKit.h>
//方向
typedef NS_ENUM(NSInteger,PTMarqueeType) {
    PTMarqueeTypeLeft,
    PTMarqueeTypeRight,
    PTMarqueeTypeReverse
};
@interface PTMarqueeView : UIView
@property (nonatomic, assign) PTMarqueeType marqueeType;//默认left
@property (nonatomic, assign) CGFloat     contentMargin;//默认 12
@property (nonatomic, assign) NSInteger   frameInterval;//默认 1
@property (nonatomic, assign) CGFloat     pointPerFrame;//每次回调移动多少点 默认0.5

@property (nonatomic, strong) UIView      *contentView;
@property (nonatomic, copy) void (^contentViewFrameConfigWhenCantMarquee)(UIView *);//这里可以重设contentview的size 默认是sizeToFit

- (void)reloadData;
- (void)startMarquee;
- (void)stopMarquee;
@end


