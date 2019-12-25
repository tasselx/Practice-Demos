//
//  ViewController.m
//  PTCustomPresent
//
//  Created by tassel on 2019/12/23.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ViewController.h"
#import "PTCustomPresentationController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    presentButton.frame = CGRectMake(100, 50, 100, 50);
    [presentButton setTitle:@"模态" forState:UIControlStateNormal];
    [presentButton addTarget:self action:@selector(testPresentVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton];
    
}

- (void)testPresentVC {
    TestViewController *secondViewController = [TestViewController new];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:secondViewController];
    nav.navigationBarHidden = YES;
    
    PTCustomPresentationController *presentationController NS_VALID_UNTIL_END_OF_SCOPE;
    
    
    
    presentationController = [[PTCustomPresentationController alloc] initWithPresentedViewController:nav presentingViewController:self];
    
    nav.transitioningDelegate = presentationController;
    
    [self presentViewController:nav animated:YES completion:NULL];
}


@end
