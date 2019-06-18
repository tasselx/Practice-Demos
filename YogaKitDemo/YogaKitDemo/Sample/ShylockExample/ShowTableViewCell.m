//
//  ShowTableViewCell.m
//  YogaKitDemo
//
//  Created by tassel on 2019/6/17.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ShowTableViewCell.h"
@interface ShowTableViewCell()

@end

@implementation ShowTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.font = [UIFont systemFontOfSize:14];
        self.textLabel.numberOfLines = 2;
        self.textLabel.adjustsFontSizeToFitWidth = YES;
        self.textLabel.minimumScaleFactor = 0.8;
        self.detailTextLabel.textColor = [UIColor lightGrayColor];
        
        UIImageView *accessoryView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
        accessoryView.image = [UIImage imageNamed:@"download"];
        self.accessoryView = accessoryView;
        
        self.backgroundColor = [UIColor clearColor];
        self.separatorInset = UIEdgeInsetsZero;
    }
    return self;
}
- (void)setShow:(ShowModel *)show {
    _show = show;
    self.textLabel.text = show.title;
    self.detailTextLabel.text = show.length;
    self.imageView.image = [UIImage imageNamed:show.image];
}
@end
