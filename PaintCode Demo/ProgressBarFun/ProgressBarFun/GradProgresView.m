//
//  GradProgresView.m
//  ProgressBarFun
//
//  Created by tassel on 2020/1/8.
//  Copyright © 2020 tassel. All rights reserved.
//

#import "GradProgresView.h"
@interface GradProgresView() {
    CGFloat _innerProgress;
}
@end

@implementation GradProgresView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)setProgress:(CGFloat)progress {

    if (progress > 1.0) {
        _innerProgress = 1.0;
    }else if(progress < 0.0) {
        _innerProgress = 0.0;
    }else {
        _innerProgress = progress;
    }
    [self setNeedsDisplay];
}
- (CGFloat)progress {
    return _innerProgress *self.bounds.size.width;
}

+ (void)drawProgressViewWithFrame: (CGRect)frame progress: (CGFloat)progress {
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* gradientColor = [UIColor colorWithRed: 0.431 green: 0.616 blue: 1 alpha: 1];
    UIColor* gradientColor2 = [UIColor colorWithRed: 0.459 green: 0.808 blue: 1 alpha: 1];
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.2];

    //// Gradient Declarations
    CGFloat gradientLocations[] = {0, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(NULL, (__bridge CFArrayRef)@[(id)gradientColor.CGColor, (id)gradientColor2.CGColor], gradientLocations);

    //// Progress Border Drawing
    UIBezierPath* progressBorderPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), floor((frame.size.width) * 1.00000 + 0.5), floor((frame.size.height) * 1.00000 + 0.5)) cornerRadius: 4];
    [color2 setFill];
    [progressBorderPath fill];


    //// Progress Bar Drawing
    CGRect progressBarRect = CGRectMake(0, 0, progress, 8);
    UIBezierPath* progressBarPath = [UIBezierPath bezierPathWithRoundedRect: progressBarRect cornerRadius: 4];
    CGContextSaveGState(context);
    [progressBarPath addClip];
    CGContextDrawLinearGradient(context, gradient,
        CGPointMake(CGRectGetMidX(progressBarRect) + -39 * progressBarRect.size.width / 78, CGRectGetMidY(progressBarRect) + 4 * progressBarRect.size.height / 8),
        CGPointMake(CGRectGetMidX(progressBarRect) + 39 * progressBarRect.size.width / 78, CGRectGetMidY(progressBarRect) + -4 * progressBarRect.size.height / 8),
        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);


    //// Cleanup
    CGGradientRelease(gradient);
}

- (void)drawRect:(CGRect)rect {
    
    [GradProgresView drawProgressViewWithFrame:self.bounds progress:self.progress];
}
@end
