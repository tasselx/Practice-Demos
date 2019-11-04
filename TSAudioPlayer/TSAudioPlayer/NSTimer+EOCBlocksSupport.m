//
//  NSTimer+EOCBlocksSupport.m
//  TSAudioPlayer
//
//  Created by tassel on 2019/11/4.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "NSTimer+EOCBlocksSupport.h"

@implementation NSTimer (EOCBlocksSupport)
+ (NSTimer *)eoc_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                          block:(void(^)())block
                                        repeats:(BOOL)repeats
{
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(eoc_blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}

+ (void)eoc_blockInvoke:(NSTimer*)timer {
    void (^block)() = timer.userInfo;
    if (block) {
        block();
    }
}
@end
