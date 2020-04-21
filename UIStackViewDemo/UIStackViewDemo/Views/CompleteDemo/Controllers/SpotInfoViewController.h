//
//  SpotInfoViewController.h
//  UIStackViewDemo
//
//  Created by tassel on 2020/4/21.
//  Copyright © 2020 tassel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VacationSpot.h"
#import "TSExampleListViewController.h"

@interface SpotInfoViewController : UIViewController
@property (nonatomic, strong) VacationSpot *vacationSpot;
@property (nonatomic, weak) TSExampleListViewController *vc;
@end
