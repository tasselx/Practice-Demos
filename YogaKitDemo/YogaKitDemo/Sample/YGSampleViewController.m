//
//  YGSampleViewController.m
//  YogaKitDemo
//
//  Created by tassel on 2019/6/17.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "YGSampleViewController.h"
#import "KVOController.h"
#import "Masonry.h"
BOOL IsPortrait(void) {
    CGRect rcScreen = [[UIScreen mainScreen]bounds];
    return rcScreen.size.height > rcScreen.size.width ;
}
@interface YGSampleViewController ()

@property (nonatomic, assign) YGSampleType type;
@property (nonatomic, strong) FBKVOController *kvoController;
@end

@implementation YGSampleViewController

- (instancetype)initWithType:(YGSampleType)type {
    self = [super init];
    if (self) {
        self.type = type;
    }
  return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    YGSampleView *sampleView = [[YGSampleView alloc] initWithType:_type];
    [self.view addSubview:sampleView];
    
    FBKVOController *KVOController = [FBKVOController controllerWithObserver:self];
    self.kvoController = KVOController;
    [self.kvoController observe:self.view keyPath:@"frame" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        CGSize szNew = [change[NSKeyValueChangeNewKey] CGRectValue].size;
        CGSize szOld = [change[NSKeyValueChangeOldKey] CGRectValue].size;
        if (!CGSizeEqualToSize(szNew, szOld)) {
            [self layoutFlexRootViews];
        }
    }];
}

- (void)layoutFlexRootViews {
//    BOOL isPortrait = IsPortrait();
//    for (UIView *subview in self.view.subviews) {
//        
//        [subview setNeedsLayout];
//    }
}



@end
