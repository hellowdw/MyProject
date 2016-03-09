//
//  NSError+WC.m
//  wochudemo
//
//  Created by wochu on 16/3/2.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "NSError+WC.h"

@implementation NSError (WC)

- (NSString *)errorDescription {
    NSString *__description = nil;
    switch (self.code) {
        case WCRemindErrorCode:
            __description = self.localizedDescription;
            break;
        case WCServiceErrorCode:
//            __description = @"服务器错误";
//            break;
        case WCLocalErrorCode:
            __description = @"亲，数据不给力！";
            break;
        case WCNetworkErrorCode:
            __description = @"亲，网络不给力！";
            break;
        case WCCrashErrorCode:
            __description = @"亲，挂掉了！";
            break;
        default:
            __description = @"亲，网络不给力！";
            break;
    }
    return __description;
}

@end
