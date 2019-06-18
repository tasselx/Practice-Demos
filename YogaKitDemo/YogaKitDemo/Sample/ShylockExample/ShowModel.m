//
//  ShowModel.m
//  YogaKitDemo
//
//  Created by tassel on 2019/6/17.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ShowModel.h"

@implementation ShowModel
+(NSArray<ShowModel *> *)loadShows {
    return [ShowModel loadMixerFrom:@"Shows"];
}
+(NSArray<ShowModel *> *)loadMixerFrom:(NSString *)file {
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:@"plist"];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *showArray = [NSMutableArray array];
    for (NSDictionary *dict in dictArray) {
        ShowModel *model = [ShowModel new];
        model.title = dict[@"title"];
        model.length = dict[@"length"];
        model.detail = dict[@"detail"];
        model.image = dict[@"image"];
        [showArray addObject:model];
    }
    return  showArray;
}
@end
