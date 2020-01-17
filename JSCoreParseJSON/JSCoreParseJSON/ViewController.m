//
//  ViewController.m
//  JSCoreParseJSON
//
//  Created by tassel on 2020/1/17.
//  Copyright © 2020 tassel. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    FormatJSON(string);
}

static NSString *FormatJSON(NSString *string) {
    JSContext *context = [JSContext new];
    JSValue *parse = context[@"JSON"][@"parse"];
    JSValue *stringify = context[@"JSON"][@"stringify"];
    JSValue *pretty = [stringify callWithArguments:@[
        [parse callWithArguments:@[string]],
        [JSValue valueWithNullInContext:context],
        @"    "
    ]];
//    [parse callWithArguments:@[string]].toDictionary
    return pretty.isUndefined?string:pretty.toString;
}

@end
