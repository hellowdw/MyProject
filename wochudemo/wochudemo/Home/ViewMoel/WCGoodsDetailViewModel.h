//
//  WCGoodsDetailViewModel.h
//  wochudemo
//
//  Created by wochu on 16/4/20.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseViewModel.h"
#import "WCGoodsAccess.h"

@class WCGoods;
@interface WCGoodsDetailViewModel : WCBaseViewModel

- (NSInteger)numberOfItemsOrRowsInSction:(NSInteger)section;

/**
 *  刷新商品信息
 */
- (void)refreshAdvertiseWithGoodsGuid:(NSString *)goodsGuid action:(WCCommonAction)action;

/**
 * 刷新商品
 */
- (void)refreshWithGoodsGuid:(NSString *)goodsGuid action:(WCDoneAction)action;


@end
