//
//  WCActivityAccess.m
//  wochudemo
//
//  Created by wochu on 16/3/2.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCActivityAccess.h"
#import "WCVersion.h"
#import "WCAdvertising.h"
#import "WCBaseGoods.h"
#import "WCGoodsActs.h"

@implementation WCActivityAccess

/**
 *  首页的广告栏和爆款商品
 */
+ (void)getHomeLayoutWithPage:(NSInteger)page count:(NSInteger)count action:(WCHomeLayoutAction)action {
    NSDictionary *parameter = @{@"version":[WCVersion appVersion],@"source":@"I"};
    
    NSDictionary *parameters = [WCBaseAccess assembleParameterWithKey:@"parameters" parameters:parameter];
    [self GET:[self assembleURLString:@"app/layout"] parameters:parameters action:^(NSURLSessionDataTask *task, id responeObject, NSError *error) {
        if (error) {
            
            DLog(@"%@",error.localizedDescription);
            return action(nil,nil,error);
        } else {
            //广告
            NSArray *ads = [WCAdvertising mj_objectArrayWithKeyValuesArray:responeObject[@"data"][@"carousel"]];
            //爆款商品
            NSArray *goods = [WCBaseGoods mj_objectArrayWithKeyValuesArray:responeObject[@"data"][@"recommendedEntries"]];
            
            return action(ads,goods,nil);
        }
    }];
}

/**
 *  获取商品活动
 */
+ (void)getGoodsActsAction:(WCCommonAction)action {
    NSDictionary *dict = @{@"version":[WCVersion appVersion],@"source":@"I"};
    NSDictionary *parameters = [self assembleParameterWithKey:@"parameters" parameters:dict];
    [self GET:[self assembleURLString:@"acts"] parameters:parameters action:^(NSURLSessionDataTask *task, id responeObject, NSError *error) {
        if (error) {
            return action (nil,error);
        } else {
            NSArray *acts = [WCGoodsActs mj_objectArrayWithKeyValuesArray:responeObject[@"data"][@"acts"]];
            return action(acts,nil);
        }
    }];
}

+ (void)getGoodsAdvertiseWithGoodsGuid:(NSString *)goodsGuid action:(WCCommonAction)action {
    NSDictionary *dict = @{@"goodsGuid" : goodsGuid};
    NSDictionary *parameters = [self assembleParameterWithKey:@"parameters" parameters:dict];
    [self GET:[self assembleURLString:@"goods/imgLoopList"] parameters:parameters action:^(NSURLSessionDataTask *task, id responeObject, NSError *error) {
        if (error) {
            return action(nil, error);
        } else {
            NSArray *ads = [WCAdvertising mj_objectArrayWithKeyValuesArray:responeObject[@"data"]];
            return action(ads, error);
        }
    }];
}

@end
