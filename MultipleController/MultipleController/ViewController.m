//
//  ViewController.m
//  MultipleController
//
//  Created by tassel on 2019/7/1.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ViewController.h"
#import "HomeOneViewController.h"
#import "HomeTwoViewController.h"

@interface ViewController ()

@property (nonatomic, strong) HomeTwoViewController *twoViewController;
@property (nonatomic, strong) HomeOneViewController *oneViewController;
@property (nonatomic, strong) UIViewController      *showingViewController;
@property (nonatomic, assign) NSInteger        index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.oneViewController.view.hidden = NO;
//    self.twoViewController.view.hidden = NO;
//    NSLog(@"xxx %@",self.childViewControllers);
    [self displayContentController:self.oneViewController];
}

- (CGRect)frameForContentController {
    return CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64);
}
- (void)displayContentController:(UIViewController*) content {
    [self addChildViewController:content];
    content.view.frame = [self frameForContentController];
    [self.view addSubview:content.view];
//    [UIView transitionWithView:self.view duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve|UIViewAnimationOptionCurveEaseInOut animations:^{
//        [self.view addSubview:content.view];
//
//    } completion:nil];
    [content didMoveToParentViewController:self];
}
- (void)hideContentController:(UIViewController*) content {
    [content willMoveToParentViewController:nil];
    [content.view removeFromSuperview];
    [content removeFromParentViewController];
}
- (void)transitionFromOldViewController:(UIViewController *)oldViewController toNewViewController:(UIViewController *)newViewController{
    [self transitionFromViewController:oldViewController toViewController:newViewController duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        if (finished) {
            [newViewController didMoveToParentViewController:self];
            self.showingViewController = newViewController;
        }
    }];
}
- (HomeOneViewController *)oneViewController {
    if (!_oneViewController) {
        _oneViewController = [HomeOneViewController new];
//        [self addChildViewController:_oneViewController];

    }
    return _oneViewController;
}
- (HomeTwoViewController *)twoViewController {
    if (!_twoViewController) {
        _twoViewController = [HomeTwoViewController new];
//        [self addChildViewController:_twoViewController];

    }
    return _twoViewController;
}
- (IBAction)switchVC:(UIBarButtonItem *)sender {
    
    self.index = _index==0?1:0;
    
    if (_index == 1) {
        [self hideContentController:self.oneViewController];
        [self displayContentController:self.twoViewController];
    }else {
        [self hideContentController:self.twoViewController];
        [self displayContentController:self.oneViewController];
    }

    
    NSLog(@"xxx %@",self.childViewControllers);

//    [self.showingChildVC.view removeFromSuperview];
//    UIViewController *newVc = self.childViewControllers[_index];
//    newVc.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64);
//
//    CATransition *applicationLoadViewIn =[CATransition animation];
//    [applicationLoadViewIn setDuration:0.25];
//    [applicationLoadViewIn setType:kCATransitionFade];
//    [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
//    [[self.view layer]addAnimation:applicationLoadViewIn forKey:kCATransitionReveal];
//    [self.view addSubview:newVc.view];
//    [UIView transitionWithView:self.view duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve|UIViewAnimationOptionCurveEaseInOut animations:^{
//        [self.view addSubview:newVc.view];
//
//    } completion:nil];
  
//    self.showingChildVC = newVc;
    
}


@end
