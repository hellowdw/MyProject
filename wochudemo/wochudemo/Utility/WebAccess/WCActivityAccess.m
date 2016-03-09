//
//  WCActivityAccess.m
//  wochudemo
//
//  Created by wochu on 16/3/2.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCActivityAccess.h"
#import "WCVersion.h"

@implementation WCActivityAccess

+ (void)getHomeLayoutWithPage:(NSInteger)page count:(NSInteger)count action:(WCHomeLayoutAction)action {
    NSDictionary *dict = @{@"version":[WCVersion appVersion],@"source":@"I"};
}

@end
