//
//  ViewController.m
//  ProgressBarFun
//
//  Created by tassel on 2019/6/24.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ViewController.h"
#import "ProgressBarView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet ProgressBarView *progressBarView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)sliderMoved:(UISlider *)sender {
    
    self.progressBarView.progress = sender.value;
}

@end
