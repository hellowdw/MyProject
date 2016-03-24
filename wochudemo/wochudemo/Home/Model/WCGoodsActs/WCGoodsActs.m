//
//  WCGoodsActs.m
//  wochudemo
//
//  Created by wochu on 16/3/21.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCGoodsActs.h"
#import "WCGoodsAction.h"

@implementation WCGoodsActs

+ (NSDictionary *)mj_objectClassInArray {
    
    return @{@"items":[WCGoodsAction class]};
    
}

@end
