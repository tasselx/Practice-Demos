//
//  ShowModel.h
//  YogaKitDemo
//
//  Created by tassel on 2019/6/17.
//  Copyright © 2019 tassel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *length;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *image;

+(NSArray<ShowModel *> *)loadShows;
@end

NS_ASSUME_NONNULL_END
