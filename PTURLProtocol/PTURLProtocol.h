//
//  PTURLProtocol.h
//  keke
//
//  Created by tassel on 2020/3/17.
//  Copyright © 2020 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTURLProtocol : NSURLProtocol
+ (void)registerProtocol;
+ (void)unregisterProtocol;
@end
