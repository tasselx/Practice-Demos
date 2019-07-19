//
//  PTMarqueeView.m
//  PTMarqueeView
//
//  Created by tassel on 2019/7/10.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "PTMarqueeView.h"

@interface UIView (PTMarqueeView)
- (UIView *)copyMarqueeView ;
@end
@implementation UIView(PTMarqueeView)
//
- (UIView *)copyMarqueeView {
    
    NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject:self];
    UIView *copyView = (UIView *)[NSKeyedUnarchiver unarchiveObjectWithData:archivedData];
    return copyView;
    
}

@end

@interface PTMarqueeView()
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) CADisplayLink *marqueeDisplayLink;
@property (nonatomic, assign) BOOL isReversing;
@end
@implementation PTMarqueeView

- (void)dealloc {
    _contentViewFrameConfigWhenCantMarquee = nil;
}
- (void)willMoveToSuperview:(UIView *)newSuperview {
    //当视图被移除父视图的时候,newSuperView为nil 停止CADisplayLink
    if (newSuperview==nil) {
        [self stopMarquee];
    }
}

- (void)setContentView:(UIView *)contentView {
    _contentView = contentView;
    [self setNeedsLayout];
}
- (instancetype)init {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self initializeViews];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        [self initializeViews];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self){
        [self initializeViews];
    }
    return self;
}


- (void)initializeViews {
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = YES;
    self.containerView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:_containerView];
    
    _marqueeType = PTMarqueeTypeLeft;
    _contentMargin = 12;
    _frameInterval = 1;
    _pointPerFrame = 0.5;
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (!_contentView) {return;}
    
    UIView *validContentView = _contentView;
    [[_containerView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //对于复杂视图,需要自己重写contentView的sizeThatFits方法，返回正确的size
    [validContentView sizeToFit];
    [_containerView addSubview:validContentView];
    
    if (_marqueeType == PTMarqueeTypeReverse) {
        _containerView.frame = CGRectMake(0, 0, validContentView.bounds.size.width, self.bounds.size.height);
    }else {
        _containerView.frame = CGRectMake(0, 0, validContentView.bounds.size.width*2+_contentMargin, self.bounds.size.height);
    }
    
    if (validContentView.bounds.size.width>self.bounds.size.width) {
        validContentView.frame = CGRectMake(0, 0, validContentView.bounds.size.width, self.bounds.size.height);
        if (_marqueeType!=PTMarqueeTypeReverse) {
            //UIView是没有遵从拷贝协议的，可以通过UIView支持NScoding协议，间接复制一个视图
            UIView *otherContentView = validContentView.copyMarqueeView;
            otherContentView.frame = CGRectMake(validContentView.bounds.size.width+_contentMargin, 0, validContentView.bounds.size.width, self.bounds.size.height);
            [_containerView addSubview:otherContentView];
        }
        [self startMarquee];
    } else {
        
        if (self.contentViewFrameConfigWhenCantMarquee){
            self.contentViewFrameConfigWhenCantMarquee(validContentView);
        } else {
            [self stopMarquee];
            validContentView.frame = CGRectMake(0, 0, validContentView.bounds.size.width, self.bounds.size.height);
        }
    }
}
//如果你的contentview内容在初始化的时候无法确定，需要通过网络延迟获取，那么在内容赋值之后，调用该方法即可
- (void)reloadData {
    [self setNeedsLayout];
}
- (void)startMarquee {
    [self stopMarquee];
    
    if (_contentView && _contentView.bounds.size.width < self.bounds.size.width) {
        return;
    }
    
    if (_marqueeType==PTMarqueeTypeRight) {
        CGRect frame = self.containerView.frame;
        frame.origin.x = self.bounds.size.width - frame.size.width;
        self.containerView.frame = frame;
    }
    self.marqueeDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(processMarquee)];
    self.marqueeDisplayLink.frameInterval = self.frameInterval;
    [self.marqueeDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}
- (void)stopMarquee {
    [self.marqueeDisplayLink invalidate];
    self.marqueeDisplayLink = nil;
}
-(void)processMarquee {
    CGRect frame = self.containerView.frame;
    
    switch (_marqueeType) {
        case PTMarqueeTypeLeft: {
            CGFloat targetX = -(self.contentView.bounds.size.width + self.contentMargin);
            if (frame.origin.x <= targetX) {
                frame.origin.x = 0;
                self.containerView.frame = frame;
            }else {
                frame.origin.x -= _pointPerFrame;
                if (frame.origin.x < targetX) {
                    frame.origin.x = targetX;
                }
                self.containerView.frame = frame;
            }
            break;
        }
        case PTMarqueeTypeRight: {
            CGFloat targetX = self.bounds.size.width - self.contentView.bounds.size.width;
            if (frame.origin.x >= targetX) {
                frame.origin.x = self.bounds.size.width - self.containerView.bounds.size.width;
                self.containerView.frame = frame;
            }else {
                frame.origin.x += _pointPerFrame;
                if (frame.origin.x > targetX) {
                    frame.origin.x = targetX;
                }
                self.containerView.frame = frame;
            }
            break;
        }
        case PTMarqueeTypeReverse:{
            if (_isReversing) {
                CGFloat targetX = 0;
                if (frame.origin.x > targetX) {
                    frame.origin.x = 0;
                    self.containerView.frame = frame;
                    _isReversing = false;
                }else {
                    frame.origin.x += _pointPerFrame;
                    if (frame.origin.x > 0) {
                        frame.origin.x = 0;
                        _isReversing = false;
                    }
                    self.containerView.frame = frame;
                }
            } else {
                CGFloat targetX = self.bounds.size.width - self.containerView.bounds.size.width;
                if (frame.origin.x <= targetX) {
                    _isReversing = true;
                }else {
                    frame.origin.x -= _pointPerFrame;
                    if (frame.origin.x < targetX) {
                        frame.origin.x = targetX;
                        _isReversing = true;
                    }
                    self.containerView.frame = frame;
                }
            }
            
            break;
        }
        default:
        {
            break;
        }
            
    }
    
}
#pragma mark - getter
- (UIView *)containerView {
    if (!_containerView){
        _containerView = [UIView  new];
    }
    return _containerView;
}
@end

