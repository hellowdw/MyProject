//
//  WCGoodsContentCell.m
//  wochudemo
//
//  Created by wochu on 16/4/20.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCGoodsContentCell.h"
#import "WCGoods.h"

@interface WCGoodsContentCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *ruleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellByDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *conditionLabel;


@end
@implementation WCGoodsContentCell


+ (instancetype)renderCell:(WCGoodsContentCell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element {
    WCGoods * goods = (WCGoods *)element;
    cell.nameLabel.text = goods.goodsName ? : @"";
    cell.addressLabel.text = goods.origin1 ? : @"";
    cell.ruleLabel.text = goods.specification ? : @"";
    cell.sellByDateLabel.text = goods.shelfLife ? : @"";
    cell.conditionLabel.text = goods.storageCondition ? : @"";
    return cell;
}

+ (CGFloat)cellHeightWithCell:(WCBaseTableViewCell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element {
    return WCScreenWidth > 320 ? 100 : 105;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
