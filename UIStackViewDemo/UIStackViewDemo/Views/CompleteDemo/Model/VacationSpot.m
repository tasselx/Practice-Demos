//
//  VacationSpot.m
//  UIStackViewDemo
//
//  Created by tassel on 2020/4/20.
//  Copyright © 2020 tassel. All rights reserved.
//

#import "VacationSpot.h"

@implementation VacationSpot

+ (NSArray<VacationSpot *> *)defaultSpots {
    return [VacationSpot loadVacationSpotsFromPlistNamed:@"vacation_spots"];
}
+ (NSArray<VacationSpot *> *)loadVacationSpotsFromPlistNamed:(NSString *)plistName {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    
    for (NSDictionary *dict  in dictArray) {
        
        NSInteger identifier = [dict[@"identifier"] integerValue];
        NSString *name       = [dict[@"name"] stringValue];
        NSString *locationName  = [dict[@"locationName"] stringValue];
        NSString *thumbnailName = [dict[@"thumbnailName"] stringValue];
        NSString *whyVisit      = [dict[@"whyVisit"] stringValue];
        NSString *whatToSee     = [dict[@"whatToSee"] stringValue];
        NSString *weatherInfo   = [dict[@"weatherInfo"] stringValue];
        NSInteger userRating    = [dict[@"userRating"] integerValue];
        NSString *wikipediaLink = [dict[@"wikipediaLink"] stringValue];
        double latitude      = [dict[@"latitude"] doubleValue];
        double longitude     = [dict[@"longitude"] doubleValue];
        
        NSURL *wikipediaURL = [NSURL URLWithString:wikipediaLink];
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        VacationSpot *vacationSpot = [VacationSpot new];
        vacationSpot.identifier = identifier;
        vacationSpot.name = name;
        vacationSpot.locationName = locationName;
        vacationSpot.thumbnailName = thumbnailName;
        vacationSpot.whyVisit = whyVisit;
        vacationSpot.whatToSee = whatToSee;
        vacationSpot.weatherInfo = weatherInfo;
        vacationSpot.userRating = userRating;
        vacationSpot.wikipediaURL = wikipediaURL;
        vacationSpot.coordinate = coordinate;
        
        [tempArray addObject:vacationSpot];
    }
    
    
    return tempArray;
    
}
@end
