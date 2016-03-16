//
//  WCAPPGlobal.h
//  wochudemo
//
//  Created by wochu on 16/3/14.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCObject.h"

@interface WCAPPGlobal : WCObject

+(WCAPPGlobal *) defaultAppGlobal;

/**
 *  占位图
 */
+ (UIImage *)placeholderImage;

/**
 *  颜色
 */
+ (UIColor *)orangeColor;
+ (UIColor *)grayColor;

@end
