//
//  WCBaseTableViewCell.m
//  wochudemo
//
//  Created by wochu on 16/2/17.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseTableViewCell.h"

@implementation WCBaseTableViewCell

+ (instancetype)renderCell:(WCBaseTableViewCell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element {
    WCAssert(0 && @"子类必须重写");
    return nil;
}

+ (CGFloat)cellHeightWithCell:(WCBaseTableViewCell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element {
    return 44;
}

- (void)dealloc {
    DLog(@"%@ 已经销毁",NSStringFromClass([self class]));
}

@end
