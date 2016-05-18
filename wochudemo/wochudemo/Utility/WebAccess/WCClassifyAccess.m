//
//  WCClassifyAccess.m
//  wochudemo
//
//  Created by wochu on 16/5/17.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCClassifyAccess.h"

@implementation WCClassifyAccess

+ (void)getClassifyListByMenuType:(WCClassifyMenuType)menuType action:(WCCommonAction)action {
    NSDictionary *parameters = [self assembleParameterWithKey:@"parameters" parameters:@{@"menu":@(menuType)}];
    [self GET:[self assembleURLString:@"Goods/GetCategoryListByMenu"] parameters:parameters action:^(NSURLSessionDataTask *task, id responeObject, NSError *error) {
        if (error) {
            action(nil,error);
        } else {
            NSArray *menuArray = [WCClassifyModel mj_objectArrayWithKeyValuesArray:responeObject[@"data"]];
            action(menuArray,nil);
        }
    }];
}

@end
