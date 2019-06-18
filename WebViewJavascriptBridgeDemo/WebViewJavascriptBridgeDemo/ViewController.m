//
//  ViewController.m
//  WebViewJavascriptBridgeDemo
//
//  Created by tassel on 2019/6/18.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ViewController.h"
#import "WebViewJavascriptBridge.h"
@interface ViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) WebViewJavascriptBridge *bridge;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
   
    [self.webView loadHTMLString:htmlString baseURL:nil];
}

#pragma mark - getter
- (UIWebView *)webView {
    if (!_webView) {
        _webView = ({
            UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
            webView.delegate = self;
            webView.scalesPageToFit = YES;
            webView.backgroundColor = [UIColor whiteColor];
            webView;
        });
        self.bridge = [WebViewJavascriptBridge bridgeForWebView:_webView];
        [self.bridge setWebViewDelegate:self];
        [self.view addSubview:_webView];
        //JS->原生
        @weakify(self)
        [self.bridge registerHandler:@"setNavTitle" handler:^(id data, WVJBResponseCallback responseCallback) {
            @strongify(self)
            self.title = [NSString stringWithFormat:@"%@",data];
        }];
        [self.bridge registerHandler:@"copyAction" handler:^(id data, WVJBResponseCallback responseCallback) {
            UIPasteboard *pasteborad = [UIPasteboard generalPasteboard];
            pasteborad.string = [NSString stringWithFormat:@"%@",data];
            NSLog(@"复制成功");
            //原生->JS
            [self.bridge callHandler:@"alert" data:@"复制成功" responseCallback:^(id responseData) {
                
            }];
        }];
        
    }
    return _webView;
}
#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}
@end
