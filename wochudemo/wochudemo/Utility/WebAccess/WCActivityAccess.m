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

@implementation WCActivityAccess

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

@end
