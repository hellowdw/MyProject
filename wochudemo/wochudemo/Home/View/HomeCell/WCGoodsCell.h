//
//  WCGoodsCell.h
//  wochudemo
//
//  Created by wochu on 16/3/14.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseTableViewCell.h"
#import "WCBaseGoods.h"

@interface WCGoodsCell : WCBaseTableViewCell

/**
 *  点击进商品详情
 */
- (void)setGoodsViewAction:(void(^)(WCBaseGoods *goods))action;

- (void)setTitleLabelWithString:(NSString *)title;

@end
