//
//  ViewController.m
//  PageControl
//
//  Created by tassel on 2019/6/28.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ViewController.h"
#import "PTPageControl.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
    PTPageControl *pageControl = [[PTPageControl alloc] initWithFrame:CGRectMake(0, 100,self.view.frame.size.width , 30)];
    pageControl.count = 4;
    pageControl.currentPage = 0;
    [self.view addSubview:pageControl];
    // Do any additional setup after loading the view.
}


@end
