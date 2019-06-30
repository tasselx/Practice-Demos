//
//  PTPageControl.h
//  PageControl
//
//  Created by tassel on 2019/6/28.
//  Copyright © 2019 tassel. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PTPageControl : UIView
@property (nonatomic,assign) NSInteger currentPage;
@property (nonatomic,assign) BOOL      hidesForSinglePage;
@property (nonatomic,assign) NSInteger count;
- (instancetype)initWithFrame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
