//
//  WCGoodsActivityProgram1Cell.m
//  wochudemo
//
//  Created by wochu on 16/2/17.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCGoodsActivityProgram1Cell.h"

@implementation WCGoodsActivityProgram1Cell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+ (CGFloat)cellHeightWithCell:(WCBaseTableViewCell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element {
    return WCScreenWidth/3.2;
}

@end
