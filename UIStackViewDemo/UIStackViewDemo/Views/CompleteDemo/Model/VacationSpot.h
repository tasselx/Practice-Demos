//
//  VacationSpot.h
//  UIStackViewDemo
//
//  Created by tassel on 2020/4/20.
//  Copyright © 2020 tassel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface VacationSpot : NSObject
@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, copy)   NSString  *name;
@property (nonatomic, copy)   NSString  *locationName;
@property (nonatomic, copy)   NSString  *thumbnailName;
@property (nonatomic, copy)   NSString  *whyVisit;
@property (nonatomic, copy)   NSString  *whatToSee;
@property (nonatomic, copy)   NSString  *weatherInfo;
@property (nonatomic, assign) NSInteger userRating;
@property (nonatomic, strong) NSURL     *wikipediaURL;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

+ (NSArray<VacationSpot *> *)defaultSpots;

@end

NS_ASSUME_NONNULL_END
