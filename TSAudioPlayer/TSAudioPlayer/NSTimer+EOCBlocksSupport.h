//
//  NSTimer+EOCBlocksSupport.h
//  TSAudioPlayer
//
//  Created by tassel on 2019/11/4.
//  Copyright © 2019 tassel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (EOCBlocksSupport)

+ (NSTimer *)eoc_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                          block:(void(^)())block
                                        repeats:(BOOL)repeats;
@end

NS_ASSUME_NONNULL_END
