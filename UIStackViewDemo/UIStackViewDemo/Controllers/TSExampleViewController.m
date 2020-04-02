//
//  TSExampleViewController.m
//  UIStackViewDemo
//
//  Created by tassel on 2020/4/2.
//  Copyright © 2020 tassel. All rights reserved.
//

#import "TSExampleViewController.h"

@interface TSExampleViewController ()
@property (nonatomic, strong) Class viewClass;
@end

@implementation TSExampleViewController

- (instancetype)initWithTitle:(NSString *)title viewClass:(Class)viewClass {
    self = [super init];
    if (!self) return nil;
    
    self.title = title;
    self.viewClass = viewClass;
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view = self.viewClass.new;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}


@end
