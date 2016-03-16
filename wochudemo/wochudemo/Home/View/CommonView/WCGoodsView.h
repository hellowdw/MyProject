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

- (void)renderWithGoods:(WCBaseGoods *)goods;

@end
