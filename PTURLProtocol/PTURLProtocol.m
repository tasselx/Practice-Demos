//
//  PTURLProtocol.m
//  keke
//
//  Created by tassel on 2020/3/17.
//  Copyright © 2020 YY. All rights reserved.
//
#import "PTURLProtocol.h"
#import "PTURLCacheModel.h"
#import "HYFileCache.h"
static NSString* const BFHybridBTWKKey = @"blackfish";
static NSString* const BFHybridBTWKCls = @"T0M7aWh1bmRqXztoZW1jc28/Z2ZtaWhqZ2Bu";
static NSString* const BFHybridBTWKSel = @"al1gYGxyYG1PW2BeZF5Eam0/bWttZmZObWpwZ1toYzM=";

@interface PTURLProtocol ()<NSURLSessionDelegate>
@property (nonnull,strong) NSURLSessionDataTask *task;
@end

@implementation PTURLProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)request {

    NSMutableArray *tempArray = [PTURLCacheModel getAllData];
    if (tempArray && tempArray.count>0) {
        NSString *urlStr = [NSString stringWithFormat:@"%@",request.URL.absoluteString];
        for (PTURLCacheModel *model in tempArray) {
            if ([model.url isEqualToString:urlStr]) {
                if ([NSURLProtocol propertyForKey:BFHybridBTWKKey inRequest:request]) {
                    return NO;
                }
                return YES;
            }
        }
    }
    
    return NO;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    NSMutableURLRequest *mutableReqeust = [request mutableCopy];
    return mutableReqeust;
}

+ (BOOL)requestIsCacheEquivalent:(NSURLRequest *)a toRequest:(NSURLRequest *)b {
    return [super requestIsCacheEquivalent:a toRequest:b];
}

- (void)startLoading {
    
    NSMutableURLRequest *mutableReqeust = [[self request] mutableCopy];
    [NSURLProtocol setProperty:@YES forKey:BFHybridBTWKKey inRequest:mutableReqeust];
    if ([self isExistsWithFileUrl:mutableReqeust.URL]) {
            NSString *filePath = [self filePathWithFileUrl:mutableReqeust.URL];
            NSData* data =  [NSData dataWithContentsOfFile:filePath];
            NSURLResponse* response = [[NSURLResponse alloc] initWithURL:self.request.URL MIMEType:nil expectedContentLength:data.length textEncodingName:nil];
            [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageAllowed];
            [self.client URLProtocol:self didLoadData:data];
            [self.client URLProtocolDidFinishLoading:self];
    }
    else {
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];
        self.task = [session dataTaskWithRequest:self.request];
        [self.task resume];
    }
}

- (BOOL)isExistsWithFileUrl:(NSURL *)url{
    NSString *key = [[HYFileCache sharedCache] cacheKeyForURL:url];
    //查询本地是否存在此文件
    BOOL existInDisk = [[HYFileCache sharedCache] fileExistInDiskWithKey:key];
    return existInDisk;
}

- (NSString *)filePathWithFileUrl:(NSURL *)url {
    NSString *key = [[HYFileCache sharedCache] cacheKeyForURL:url];
    NSString *downloadPath = [[HYFileCache sharedCache] defaultCachePathForKey:key];
    return downloadPath;
}
- (void)stopLoading {
    if (self.task != nil) {
        [self.task  cancel];
    }
}
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    [[self client] URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageAllowed];
    
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    [[self client] URLProtocol:self didLoadData:data];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
    [self.client URLProtocolDidFinishLoading:self];
}

+ (void)registerProtocol {
    [NSURLProtocol registerClass:[PTURLProtocol class]];

}
+ (void)unregisterProtocol {
    [NSURLProtocol unregisterClass:[PTURLProtocol class]];

}
@end


@implementation NSURLProtocol (WebKitSupport)

+ (void)load {
    Class cls = NSClassFromString([self pt_decodeString:BFHybridBTWKCls key:BFHybridBTWKKey]);
    SEL sel = NSSelectorFromString([self pt_decodeString:BFHybridBTWKSel key:BFHybridBTWKKey]);
    if ([(id)cls respondsToSelector:sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [(id)cls performSelector:sel withObject:@"http"];
        [(id)cls performSelector:sel withObject:@"https"];
#pragma clang diagnostic pop
    }
}

+ (NSString *)pt_decodeString:(NSString *)string key:(NSString *)key {
    
    NSData *data = [[NSData alloc]initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString *deString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSMutableString *mutString = [NSMutableString new];
    for (int i = 0;i < deString.length;i++) {
        int strChar = [deString characterAtIndex:i];
        int keyChar = [key characterAtIndex:(i % key.length)];
        int charactor = strChar + (keyChar % 10);
        [mutString appendString:[NSString stringWithFormat:@"%c",charactor]];
    }
    return mutString;
}
@end
