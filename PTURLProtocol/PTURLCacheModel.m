//
//  PTURLCacheModel.m
//  keke
//
//  Created by tassel on 2020/3/17.
//  Copyright © 2020 YY. All rights reserved.
//

#import "PTURLCacheModel.h"
#import "HYFileCache.h"

@implementation PTURLCacheModel

+ (LKDBHelper *)getUsingLKDBHelper {
    static LKDBHelper *db;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        db = [[LKDBHelper alloc] init];
    });
    return db;
}

//手动or自动 绑定sql列
+ (NSDictionary *)getTableMapping {
    return @{@"url": LKSQL_Mapping_Inherit,
             @"version":LKSQL_Mapping_Inherit,
            };
}
//主键
+ (NSString *)getPrimaryKey {
    return @"url";
}
+ (NSString *)getTableName {
    return @"PTURLCacheModel";
}
+ (NSArray *)getPrimaryKeyUnionArray {
    return @[@"url"];
}

+ (BOOL)needDownload:(NSString *)url version:(NSString *)version {
    NSArray *resultArray = [PTURLCacheModel searchWithWhere:@{@"url":url?:@""} orderBy:nil offset:0 count:1];
    
    if ([resultArray isKindOfClass:[NSArray class]]) {
        if (resultArray.count>0) {
            PTURLCacheModel *model = resultArray[0];
            if ([model isKindOfClass:[PTURLCacheModel class]]) {
                NSString *versionStr = [NSString stringWithFormat:@"%@",model.version];
                if ([versionStr isEqualToString:version]) {
                    return NO;
                }
                return YES;
            }
        }
    }
    return YES;
}

- (void)saveLastData {
    [self saveToDB];
}
+ (NSMutableArray *)getAllData {
   return  [PTURLCacheModel searchWithWhere:nil];
}

+ (void)clearTableDataWithUrl:(NSString *)url {
    
}
+ (NSString *)filePathWithFileUrl:(NSURL *)url {
    NSString *key = [[HYFileCache sharedCache] cacheKeyForURL:url];
    NSString *downloadPath = [[HYFileCache sharedCache] defaultCachePathForKey:key];
    return downloadPath;
}

+ (void)clearAllData {
    
    NSMutableArray *dataArray = [PTURLCacheModel getAllData];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (dataArray && dataArray.count>0) {
        for (PTURLCacheModel *model in dataArray) {
            NSString *path = [self filePathWithFileUrl:[NSURL URLWithString:model.url]];
            if (path) {
                [fileManager removeItemAtPath:path error:nil];
            }
        }
    }
    [self clearDBData];
}

+ (void)clearDBData {
    [LKDBHelper clearTableData:[PTURLCacheModel class]];
}
+ (void)clearSpecifyUrl:(NSString *)urlStr {
    NSString *path = [self filePathWithFileUrl:[NSURL URLWithString:urlStr]];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    [PTURLCacheModel deleteWithWhere:@{@"url":urlStr?:@""}];
}

@end

