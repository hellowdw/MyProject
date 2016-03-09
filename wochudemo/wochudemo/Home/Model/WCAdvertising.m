//
//  WCAdvertising.m
//  wochudemo
//
//  Created by wochu on 16/3/7.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCAdvertising.h"

@implementation WCAdvertising

//接口不统一，适应接口
- (void)setAction:(id)action {
    _action = action;
    if ([action isKindOfClass:[NSDictionary class]]) {
        if ([action[@"data"] isKindOfClass:[NSDictionary class]]) {
            NSDictionary *data = action[@"data"];
            NSString *target = data[@"target"];
            if (target.length && !_target.length) {
                _target = target;
            }
            if ([data[@"type"] isKindOfClass:[NSNumber class]] || [data[@"type"] isKindOfClass:[NSString class]]) {
                NSNumber *type = data[@"type"];
                _type = [type integerValue];
            }
        }
    }
}

@end
