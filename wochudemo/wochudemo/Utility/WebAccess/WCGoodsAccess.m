//
//  WCGoodsAccess.m
//  wochudemo
//
//  Created by wochu on 16/4/20.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCGoodsAccess.h"
#import <MJExtension/MJExtension.h>

@implementation WCGoodsAccess

/**
 *  商品详细信息
 */
+ (void)getGoodsDetailWithGoodsGuid:(NSString *)guid action:(WCGoodsDetailAction)action {
    NSDictionary *dict = @{@"goodsGuid" : guid};
    NSDictionary *parameters = [self assembleParameterWithKey:@"parameters" parameters:dict];
    [self GET:[self assembleURLString:@"goods/getInfo"] parameters:parameters action:^(NSURLSessionDataTask *task, id responeObject, NSError *error) {
        if (error) {
            return action (nil,error);
        } else {
            WCGoods *goods = [WCGoods mj_objectWithKeyValues:responeObject[@"data"]];
            return action(goods,nil);
        }
    }];
}

+ (void)getGoodsRelecentWithGoodsGuid:(NSString *)guid action:(WCGoodsRelevantAction)action {
    NSDictionary *dict = @{@"goodsGuid" : guid};
    NSDictionary *parameters = [self assembleParameterWithKey:@"parameters" parameters:dict];
    [self GET:[self assembleURLString:@"goods/getGoodsRelevantList"] parameters:parameters action:^(NSURLSessionDataTask *task, id responeObject, NSError *error) {
        if (error) {
            return action (nil,error);
        } else {
            WCGoodsRelevant *goodsRelevant = [WCGoodsRelevant mj_objectWithKeyValues:responeObject[@"data"]];
            return action(goodsRelevant,nil);
        }
    }];
}

@end


