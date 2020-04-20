//
//  CompleteDemoView.m
//  UIStackViewDemo
//
//  Created by tassel on 2020/4/20.
//  Copyright © 2020 tassel. All rights reserved.
//

#import "CompleteDemoView.h"
#import "VacationSpotCell.h"
#import "VacationSpot.h"
#import <Masonry/Masonry.h>
@interface CompleteDemoView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<VacationSpot *> *vacationSpots;
@end

@implementation CompleteDemoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.vacationSpots = [VacationSpot defaultSpots];

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
        _tableView.rowHeight = 80;
        if (@available(iOS 13.0, *)) {
            _tableView.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
        }
        [_tableView registerClass:[VacationSpotCell class] forCellReuseIdentifier:NSStringFromClass([VacationSpotCell class])];
    }
    return _tableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VacationSpotCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([VacationSpotCell class])];
    VacationSpot *vacationSpot = self.vacationSpots[indexPath.row];
    cell.nameLabel.text = vacationSpot.name;
    cell.locationNameLabel.text = vacationSpot.locationName;
    cell.thumnailImageView.image = [UIImage imageNamed:vacationSpot.thumbnailName];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.vacationSpots.count;
}

@end
