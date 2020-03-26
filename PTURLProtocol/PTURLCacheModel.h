//
//  PTURLCacheModel.h
//  keke
//
//  Created by tassel on 2020/3/17.
//  Copyright © 2020 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PTURLCacheModel : NSObject
@property (nonatomic, copy)   NSString    *version;
@property (nonatomic, copy)   NSString    *url;

//是否需要下载
+ (BOOL)needDownload:(NSString *)url version:(NSString *)version;
- (void)saveLastData;
//获取所有model数据
+ (NSMutableArray *)getAllData;
//清除所有缓存及数据表
+ (void)clearAllData;
//清除缓存的数据表
+ (void)clearDBData;
//清除指定url的缓存
+ (void)clearSpecifyUrl:(NSString *)urlStr;
@end

NS_ASSUME_NONNULL_END
