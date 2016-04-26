//
//  WCGoodsDetailHeaderView.h
//  wochudemo
//
//  Created by wochu on 16/4/18.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCGoods.h"

@interface WCGoodsDetailHeaderView : UIView

/**
 *  渲染商品详情描述
 */
- (void)renderGoodsInfoViewWith:(WCGoods *)goods;

/**
 *  渲染商品详情的广告栏
 */
- (void)renderAdvertWithImageUrlArr:(NSArray *)imageUrlArr;

@end
