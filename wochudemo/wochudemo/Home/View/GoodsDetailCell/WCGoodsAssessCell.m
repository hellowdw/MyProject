//
//  WCGoodsAccessCell.m
//  wochudemo
//
//  Created by wochu on 16/4/20.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCGoodsAssessCell.h"

@interface WCGoodsAssessCell()

@property (weak, nonatomic) IBOutlet UIImageView *mImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation WCGoodsAssessCell

+ (instancetype)renderCell:(WCGoodsAssessCell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element {
    return cell;
}

+ (CGFloat)cellHeightWithCell:(WCBaseTableViewCell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element {
    return 44;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
