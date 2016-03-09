//
//  WCVersion.h
//  wochudemo
//
//  Created by wochu on 16/3/7.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCObject.h"

@interface WCVersion : WCObject

/**
 *  bundle 版本号
 */
+ (NSString *)bundleVersion;

/**
 *  app 版本号
 */
+ (NSString *)appVersion;

@end
