//
//  WCBaseTableViewCell.h
//  wochudemo
//
//  Created by wochu on 16/2/17.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WCBaseTableViewCell : UITableViewCell

@property (strong, nonatomic) id element; //model数据

+ (instancetype)renderCell:(WCBaseTableViewCell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element;

+ (CGFloat)cellHeightWithCell:(WCBaseTableViewCell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element;

@end
