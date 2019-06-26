//
//  ViewController.m
//  ListAndGridSwitch
//
//  Created by tassel on 2019/6/26.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ViewController.h"
#import "ListItemCell.h"
#import "GridItemCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *listLayout;
@property (nonatomic, strong) UICollectionViewFlowLayout *gridLayout;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.collectionView];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.listLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[ListItemCell class] forCellWithReuseIdentifier:NSStringFromClass([ListItemCell class])];
        [_collectionView registerClass:[GridItemCell class] forCellWithReuseIdentifier:NSStringFromClass([GridItemCell class])];
    }
    return _collectionView;
}
- (UICollectionViewFlowLayout *)listLayout {
    if (!_listLayout) {
        _listLayout = [UICollectionViewFlowLayout new];
        _listLayout.itemSize = CGSizeMake(self.view.bounds.size.width, 100);
    }
    return _listLayout;
}

- (UICollectionViewFlowLayout *)gridLayout {
    if (!_gridLayout) {
        _gridLayout = [UICollectionViewFlowLayout new];
        _gridLayout.itemSize = CGSizeMake((self.view.bounds.size.width-20)/2.0, 50);
        _gridLayout.minimumLineSpacing = 2;
        _gridLayout.minimumInteritemSpacing = 2;
    }
    return _gridLayout;
}
- (IBAction)switchLayout:(UIBarButtonItem *)sender {
    if (self.collectionView.collectionViewLayout == _listLayout) {
        [_collectionView setCollectionViewLayout:self.gridLayout animated:YES];
    }else {
        [_collectionView setCollectionViewLayout:self.listLayout animated:YES];

    }
}

#pragma mark - UICollectionViewDelegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView.collectionViewLayout == _listLayout) {
        ListItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ListItemCell class]) forIndexPath:indexPath];
        return cell;
    }else {
        GridItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([GridItemCell class]) forIndexPath:indexPath];
        return cell;
    }
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}




@end
