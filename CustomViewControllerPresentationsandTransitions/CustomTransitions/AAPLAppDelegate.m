/*
 Copyright (C) 2016 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 The application delegate.
 */

#import "AAPLAppDelegate.h"

@implementation AAPLAppDelegate

//| ----------------------------------------------------------------------------
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
//    int c=2;
//    //NSObject *testValue = [NSObject new];
//    void(^testBlock)(id sender) = ^(id a) {
//        NSLog(@"%d", c);
//    };
//    
////    void(^testBlock)(void) = ^(void) {
////        NSLog(@"%d", c);
////    };
//    dispatch_block_t block = [testBlock copy];
//    //NSString *string = @"";
//    block();
    
//    testBlock(@"");
    return YES;
}


//| ----------------------------------------------------------------------------
#ifdef __IPHONE_9_0
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
#else
- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
#endif
{
    if ([UIDevice currentDevice].systemVersion.floatValue < 8.f)
        return UIInterfaceOrientationMaskPortrait;
    else
        return UIInterfaceOrientationMaskAll;
}

@end
