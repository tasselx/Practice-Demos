//
// Created by tassel on 2020/4/8.
// Copyright (c) 2020 tassel. All rights reserved.
//

#import "Demo3ViewCell.h"

@interface Demo3ViewCell()

@end

@implementation Demo3ViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    return self;
}

#pragma mark -

- (void)setupViews {

    UIStackView *main = [self rowsWithMargin:UIEdgeInsetsMake(15, 15, 15, 15) spacing:10];
    [self.contentView addSubview:main];
    [main mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];

    UIStackView *headBar = [self colsWithMargin:UIEdgeInsetsZero spacing:10];
    [main addArrangedSubview:headBar];

    UIView *icon = [self box];
    icon.layer.cornerRadius = 18;

    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(36);
    }];

    [headBar addArrangedSubview:icon];

    UIStackView *userInfo = [self rowsWithMargin:UIEdgeInsetsMake(0, 0, 0, 0) spacing:5];
    [headBar addArrangedSubview:userInfo];

    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:17];
    label.text = @"用户小宝ddaasgwergwqerg";
    label.textColor = [UIColor blueColor];
    label.textAlignment = NSTextAlignmentCenter;
    [userInfo addArrangedSubview:label];

    UILabel *label2 = [[UILabel alloc] init];
    label2.font = [UIFont systemFontOfSize:13];
    label2.text = @"12:04 北京";
    label2.textColor = [UIColor colorWithWhite:0.7 alpha:1];
    label2.textAlignment = NSTextAlignmentCenter;
    [userInfo addArrangedSubview:label2];

    UILabel *label3 = [[UILabel alloc] init];
    label3.font = [UIFont systemFontOfSize:18];
    label3.text = @"之前来中国席卷票房的《碟中谍6》，让56岁依然亲身上阵各种高危动作戏的老帅哥汤姆?克鲁斯又火了一把。年过半百，汤帅依然身材干练，飞车、开直升机丝毫不怵。";
    label3.textColor = [UIColor colorWithWhite:0.1 alpha:1];
    label3.numberOfLines = 0;
    [main addArrangedSubview:label3];

    UIStackView *imagebox = [self colsWithMargin:UIEdgeInsetsMake(0, 0, 0, 0) spacing:5];

    int cout = ceil(rand()%3) + 1;

    CGFloat w = floor(([UIScreen mainScreen].bounds.size.width - 30 - 10)/3);

    for (int i = 0; i<cout; i++) {

        UIView *img = [self box];

        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(w);
        }];

        [imagebox addArrangedSubview:img];
    }

    [main addArrangedSubview:imagebox];

}

- (UIColor *)rndColor{
    return [UIColor colorWithRed:rand()%256/255.0 green:rand()%256/255.0 blue:rand()%256/255.0 alpha:1];
}

- (UIStackView *)divWithAxis:(UILayoutConstraintAxis)layoutConstraintAxis margin:(UIEdgeInsets)marin spacing:(NSUInteger)spacing{
    UIStackView *div = [[UIStackView alloc] init];
    div.axis = layoutConstraintAxis;
    div.spacing = spacing;
    div.alignment = UIStackViewAlignmentLeading;
    div.distribution = UIStackViewDistributionEqualSpacing;
    div.layoutMargins = marin;
    div.layoutMarginsRelativeArrangement = YES;
    return div;
}

- (UIStackView *)rowsWithMargin:(UIEdgeInsets)marin spacing:(NSUInteger)spacing{
    return [self divWithAxis:UILayoutConstraintAxisVertical margin:marin spacing:spacing];
}


- (UIStackView *)colsWithMargin:(UIEdgeInsets)marin spacing:(NSUInteger)spacing{
    return [self divWithAxis:UILayoutConstraintAxisHorizontal margin:marin spacing:spacing];
}

- (UIView *)box{
    UIView * view = [[UIView alloc] init];

    view.backgroundColor = [self rndColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideView:)];
    view.userInteractionEnabled = YES;
    [view addGestureRecognizer:tap];
    return view;
}

- (void)hideView:(UIGestureRecognizer *)gest{
    UIView *view = gest.view;
    view.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    [self activeBackgroundWithIsNeed:selected];
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted
                 animated:animated];
    [self activeBackgroundWithIsNeed:highlighted];
}

-(void)activeBackgroundWithIsNeed:(BOOL)need{
    [UIView animateWithDuration:0.3 animations:^{
        if(need){
            self.contentView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        }else{
            self.contentView.backgroundColor = [UIColor whiteColor];
        }
    }];
}

@end
