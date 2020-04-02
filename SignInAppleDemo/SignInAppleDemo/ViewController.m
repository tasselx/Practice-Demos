//
//  ViewController.m
//  SignInAppleDemo
//
//  Created by tassel on 2020/3/30.
//  Copyright © 2020 tassel. All rights reserved.
//

#import "ViewController.h"
#import <AuthenticationServices/AuthenticationServices.h>
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ASAuthorizationAppleIDButton *appleIdButton = [ASAuthorizationAppleIDButton buttonWithType:ASAuthorizationAppleIDButtonTypeSignIn style:ASAuthorizationAppleIDButtonStyleWhite];
    appleIdButton.frame = CGRectMake(50, 150, 200, 50);
    [appleIdButton addTarget:self action:@selector(userAppIdLogin:) forControlEvents:UIControlEventTouchUpInside];
    appleIdButton.cornerRadius = 5;
    [self.view addSubview:appleIdButton];


}

- (void)userAppIdLogin:(id)userAppIdLogin {

    if (@available(iOS 13.0, *)) {

    }
}


@end
