//
//  ViewController.m
//  YogaKitDemo
//
//  Created by tassel on 2019/6/17.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ViewController.h"
#import "YGSampleViewController.h"
typedef NS_ENUM(NSInteger,  YGSampleSectionType) {
    YGSampleSectionTypeNormal,//普通视图
    YGSampleSectionTypeList,//列表视图
};

static NSString *const tableViewIdentifier = @"tableViewIdentifier";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *layoutSectionList;
@property (nonatomic, strong) NSArray     *layoutNormalList;
@property (nonatomic, strong) NSArray     *layoutTableList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
}

#pragma mark - tableview delegate & datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.layoutSectionList.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *list = self.layoutSectionList[section];
    return list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewIdentifier
                                                            forIndexPath:indexPath];
    NSArray *list = self.layoutSectionList[indexPath.section];
    cell.textLabel.text = list[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section ==  YGSampleSectionTypeList) {
//        YGSampleTableViewController *tableVC = [[YGSampleTableViewController alloc] init];
//        [self.navigationController pushViewController:tableVC animated:YES];
        return;
    }
    
    
    YGSampleViewController *sampleViewVC = [[YGSampleViewController alloc] initWithType:indexPath.row];
    [self.navigationController pushViewController:sampleViewVC animated:YES];
}

/**
 * 未处理旋转屏幕情况可以通过kvo监听self.view frame的改变做调整
 */

#pragma mark - getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = ({
            UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
            [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewIdentifier];
            tableView.delegate = self;
            tableView.dataSource = self;
            tableView;
        });
    }
    return _tableView;
}
- (NSArray *)layoutSectionList{
    if (!_layoutSectionList) {
        _layoutSectionList = @[self.layoutNormalList,self.layoutTableList];
    }
    return _layoutSectionList;
}

- (NSArray *)layoutNormalList{
    if (!_layoutNormalList) {
        _layoutNormalList = @[@"居中布局",@"嵌套布局",@"等间距布局",@"等间距自动设宽",@"ScrollView排布设contentSize",@"缩放动画"];
    }
    return _layoutNormalList;
}

- (NSArray *)layoutTableList{
    if (!_layoutTableList) {
        _layoutTableList = @[@"微博列表"];
    }
    return _layoutTableList;
}


@end
