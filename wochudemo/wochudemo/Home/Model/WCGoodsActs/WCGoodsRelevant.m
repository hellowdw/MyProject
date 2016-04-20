//
//  WCGoodsRelevant.m
//  MyKitchen
//
//  Created by Mac on 15/10/13.
//  Copyright © 2015年 WoChu. All rights reserved.
//

#import "WCGoodsRelevant.h"
#import "WCBaseGoods.h"
#import <MJExtension/MJExtension.h>

@implementation WCGoodsRelevant

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"userloving" : [WCBaseGoods class], @"ohterUserChoice" : [WCBaseGoods class]};
}

@end
