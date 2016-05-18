//
//  WCClassifyTableViewCell.m
//  wochudemo
//
//  Created by wochu on 16/5/17.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCClassifyTableViewCell.h"
#import "WCClassifyModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "WCAPPGlobal.h"

@interface WCClassifyTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *mImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) WCClassifyModel *classifyModel;

@end

@implementation WCClassifyTableViewCell

+ (instancetype)renderCell:(WCClassifyTableViewCell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element {
    cell.element = element;
    WCClassifyModel *classifyModel = (WCClassifyModel *)element;
    cell.titleLabel.text = classifyModel.name ? : @"";
    return cell;
}

+ (CGFloat)cellHeightWithCell:(WCBaseTableViewCell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element {
    return 60;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    _titleLabel.textColor = selected ? [UIColor whiteColor] : [WCAPPGlobal grayColor];
    WCClassifyModel *category = (WCClassifyModel *)self.element;
    [_mImageView sd_setImageWithURL:[NSURL URLWithString:(selected ? category.checkicon : category.uncheckicon)] placeholderImage:nil];
   self.backgroundColor = selected ? [WCAPPGlobal orangeColor] : [UIColor clearColor];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
