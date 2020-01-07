/*
 Copyright (C) 2016 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 The initial view controller for the Custom Presentation demo.
 */

#import "AAPLCustomPresentationFirstViewController.h"
#import "AAPLCustomPresentationController.h"

@implementation AAPLCustomPresentationFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    // NOTE: View controllers presented with custom presentation controllers
    //       do not assume control of the status bar appearance by default
    //       (their -preferredStatusBarStyle and -prefersStatusBarHidden
    //       methods are not called).  You can override this behavior by
    //       setting the value of the presented view controller's
    //       modalPresentationCapturesStatusBarAppearance property to YES.
    /* self.modalPresentationCapturesStatusBarAppearance = YES; */
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap)];
    [self.view addGestureRecognizer:tap];
}

-(void)handleTap{
    if(self.childViewControllers.count > 0){
        UINavigationController *nav = self.childViewControllers[0];

        [UIView animateWithDuration:0.5 animations:^{
            nav.view.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height-300);
        } completion:^(BOOL finished) {
            [nav willMoveToParentViewController:nil];
            [nav removeFromParentViewController];
            [nav.view  removeFromSuperview];
        }];
    }
    
}

#pragma mark -
#pragma mark Presentation

//- (UIModalPresentationStyle)modalPresentationStyle
//{
//    return UIModalPresentationFullScreen;
//}

//| ----------------------------------------------------------------------------
- (IBAction)buttonAction:(UIButton*)sender
{
    UIViewController *secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:secondViewController];

    // For presentations which will use a custom presentation controller,
    // it is possible for that presentation controller to also be the
    // transitioningDelegate.  This avoids introducing another object
    // or implementing <UIViewControllerTransitioningDelegate> in the
    // source view controller.
    //
    // transitioningDelegate does not hold a strong reference to its
    // destination object.  To prevent presentationController from being
    // released prior to calling -presentViewController:animated:completion:
    // the NS_VALID_UNTIL_END_OF_SCOPE attribute is appended to the declaration.
    AAPLCustomPresentationController *presentationController NS_VALID_UNTIL_END_OF_SCOPE;
   
//    presentationController = [[AAPLCustomPresentationController alloc] initWithPresentedViewController:secondViewController presentingViewController:self];
    
    //secondViewController.transitioningDelegate = presentationController;
    
    //presentationController = [[AAPLCustomPresentationController alloc] initWithPresentedViewController:nav presentingViewController:self];

    //nav.transitioningDelegate = presentationController;

    //[self presentViewController:nav animated:YES completion:NULL];
    
    [self addChildViewController:nav];
    nav.view.layer.cornerRadius = 40;
    nav.view.layer.masksToBounds = YES;
    [self.view  addSubview:nav.view];
    nav.view.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height-300);
    [UIView animateWithDuration:0.5 animations:^{
        nav.view.frame = CGRectMake(0, 300, self.view.bounds.size.width, self.view.bounds.size.height-300);
    }];

    [nav didMoveToParentViewController:self];
}


@end
