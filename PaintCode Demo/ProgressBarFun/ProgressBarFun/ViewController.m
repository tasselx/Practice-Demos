//
//  ViewController.m
//  ProgressBarFun
//
//  Created by tassel on 2019/6/24.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ViewController.h"
#import "ProgressBarView.h"
#import "GradProgresView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet ProgressBarView *progressBarView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GradProgresView *pro = [[GradProgresView alloc] initWithFrame:CGRectMake(50, 300, 100, 8)];
    pro.progress = 0.1;
    [self.view addSubview:pro];
    
  
    UIView *BgView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 500, 500)];
    BgView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:BgView];
 
    
    UIBezierPath *tempPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(120, 150, 50, 50) byRoundingCorners:(UIRectCornerTopLeft |UIRectCornerTopRight |UIRectCornerBottomRight|UIRectCornerBottomLeft) cornerRadii:CGSizeMake(4, 4)];
    UIView *guideView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    guideView.backgroundColor = [UIColor blackColor];
    guideView.alpha = 0.6;
    BgView.layer.mask = [self addTransparencyViewWith:tempPath];
    [[UIApplication sharedApplication].keyWindow addSubview:guideView];
    
    
}

- (CAShapeLayer *)addTransparencyViewWith:(UIBezierPath *)tempPath{

    UIBezierPath *path = [UIBezierPath bezierPathWithRect:[UIScreen mainScreen].bounds];
    [path appendPath:tempPath];
    path.usesEvenOddFillRule = YES;
 
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor= [UIColor blackColor].CGColor;  //其他颜色都可以，只要不是透明的
    shapeLayer.fillRule=kCAFillRuleEvenOdd;
    return shapeLayer;
}

- (IBAction)sliderMoved:(UISlider *)sender {
    
    self.progressBarView.progress = sender.value;
}

@end
