//
//  WCBaseGoods.m
//  wochudemo
//
//  Created by wochu on 16/3/7.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseGoods.h"

@implementation WCBaseGoods

- (void)setAction:(NSDictionary *)action {
    _action = action;
    if ([action isKindOfClass:[NSDictionary class]]) {
        NSDictionary *data = action[@"data"];
        if ([data isKindOfClass:[NSDictionary class]]) {
            NSString *guid = data[@"target"];
            if (guid.length && !_goodsGuid.length) {
                _goodsGuid = guid;
            }
            NSString *icon = data[@"icon"];
            if (icon.length && !_icon.length) {
                _icon = icon;
            }
            NSNumber *priceNumber = data[@"price"];
            if (priceNumber && _price == 0.0) {
                _price = [priceNumber doubleValue];
            }
            NSNumber *markerPrice = data[@"marketPrice"];
            if (markerPrice && _marketPrice == 0.0) {
                _marketPrice = [markerPrice doubleValue];
            }
        }
    }
}

@end
