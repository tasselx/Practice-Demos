//
//  ProgressBarView.m
//  ProgressBarFun
//
//  Created by tassel on 2019/6/24.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ProgressBarView.h"
#import "ProgressBarDraw.h"

@interface ProgressBarView()
{
    CGFloat _innerProgress;
}
@end
@implementation ProgressBarView

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

- (void)drawRect:(CGRect)rect {
    [ProgressBarDraw drawProgressBarWithFrame:self.bounds progress:self.progress];
}


@end
