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

@interface WCGoodsAccess : WCBaseAccess

/**
 *  商品详细信息
 */
+ (void)getGoodsDetailWithGoodsGuid:(NSString *)guid action:(WCGoodsDetailAction)action;


@end
