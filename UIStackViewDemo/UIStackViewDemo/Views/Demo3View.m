//
// Created by tassel on 2020/4/8.
// Copyright (c) 2020 tassel. All rights reserved.
//

#import "Demo3View.h"
#import "Demo3ViewCell.h"
@interface Demo3View()<UITableViewDataSource, UITableViewDelegate>
@property  (nonatomic, strong) UITableView *tableView;
@end

@implementation Demo3View

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}
- (void)setupViews {
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}
#pragma mark -
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        [_tableView registerClass:[Demo3ViewCell class] forCellReuseIdentifier:@"Demo3ViewCell"];
    }

    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Demo3ViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Demo3ViewCell"];
    return cell;
}

@end
