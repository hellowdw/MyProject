//
//  WCGoodsAccess.h
//  wochudemo
//
//  Created by wochu on 16/4/20.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseAccess.h"
#import "WCGoods.h"

typedef void(^WCGoodsDetailAction)(WCGoods *goods,NSError *error);
typedef void(^WCGoodsRelevantAction)(WCGoodsRelevant *goodsReleVant,NSError *error);

@interface WCGoodsAccess : WCBaseAccess

/**
 *  商品详细信息
 */
+ (void)getGoodsDetailWithGoodsGuid:(NSString *)guid action:(WCGoodsDetailAction)action;

/**
 *  获取商品详情相关联的商品
 */
+ (void)getGoodsRelecentWithGoodsGuid:(NSString *)guid action:(WCGoodsRelevantAction)action;


@end
