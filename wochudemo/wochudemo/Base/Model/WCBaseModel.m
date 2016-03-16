//
//  WCBaseModel.m
//  wochudemo
//
//  Created by wochu on 16/3/7.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseModel.h"

@implementation WCBaseModel

- (instancetype)initWithID:(int64_t)ID {
    if (self = [super init]) {
        _ID = ID;
    }
    return self;
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end
