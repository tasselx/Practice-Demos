//
//  VacationSpotCell.m
//  UIStackViewDemo
//
//  Created by tassel on 2020/4/20.
//  Copyright © 2020 tassel. All rights reserved.
//

#import "VacationSpotCell.h"
#import <Masonry/Masonry.h>
@implementation VacationSpotCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.locationNameLabel];
    [self.contentView addSubview:self.thumnailImageView];
    
    [self.thumnailImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(60);
        make.leading.mas_equalTo(self).offset(15);
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(80);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.thumnailImageView.mas_trailing).offset(10);
        make.top.mas_equalTo(self.thumnailImageView).offset(15);
    }];
    
    [self.locationNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameLabel.mas_bottom);
        make.leading.mas_equalTo(self.nameLabel);
    }];
    
    
}

- (UIImageView *)thumnailImageView {
    if (!_thumnailImageView) {
        _thumnailImageView = [UIImageView new];
    }
    return _thumnailImageView;
}
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
    }
    return _nameLabel;
}
- (UILabel *)locationNameLabel {
    if (!_locationNameLabel) {
        _locationNameLabel = [UILabel new];
        _locationNameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _locationNameLabel;
}
@end
