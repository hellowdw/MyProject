//
//  WCGoodsView.h
//  wochudemo
//
//  Created by wochu on 16/3/14.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCBaseGoods.h"

@interface WCGoodsView : UIView

+ (instancetype)goodsView;

/**
 * 渲染goodsView
 */
- (void)renderWithGoods:(WCBaseGoods *)goods;

/**
 *  点击商品进详情
 */
- (void)setPressedGoodsViewActon:(void(^)(WCBaseGoods *goods))action;

@end
