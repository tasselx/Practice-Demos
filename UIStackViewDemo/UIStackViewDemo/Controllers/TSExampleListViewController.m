//
//  TSExampleListViewController.m
//  UIStackViewDemo
//
//  Created by tassel on 2020/4/2.
//  Copyright © 2020 tassel. All rights reserved.
//

#import "TSExampleListViewController.h"
#import "TSExampleViewController.h"
#import "StoryView.h"
static NSString * const kTSCellReuseIdentifier = @"kMASCellReuseIdentifier";

@interface TSExampleListViewController ()

@property (nonatomic, strong) NSArray *exampleControllers;

@end

@implementation TSExampleListViewController

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    self.title = @"Examples";
    
    self.exampleControllers = @[
        [[TSExampleViewController alloc] initWithTitle:@"Story View" viewClass:StoryView.class]
    ];
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:kTSCellReuseIdentifier];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.exampleControllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *viewController = self.exampleControllers[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTSCellReuseIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = viewController.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = self.exampleControllers[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end