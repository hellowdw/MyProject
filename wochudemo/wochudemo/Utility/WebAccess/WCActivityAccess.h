//
//  WCActivityAccess.h
//  wochudemo
//
//  Created by wochu on 16/3/2.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseAccess.h"

typedef void(^WCHomeLayoutAction)(NSArray *ads,NSArray *goods,NSError *error);

@interface WCActivityAccess : WCBaseAccess

/**
 *  首页的广告栏和爆款商品
 */
+ (void)getHomeLayoutWithPage:(NSInteger)page count:(NSInteger)count action:(WCHomeLayoutAction)action;

/**
 *  获取商品活动
 */
+ (void)getGoodsActsAction:(WCCommonAction)action;

@end
