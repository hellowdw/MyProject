//
//  WCViewControllerLoader.h
//  wochudemo
//
//  Created by wochu on 16/3/24.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCObject.h"

@interface WCViewControllerLoader : WCObject

/**
 *  首页的storyboard
 */
+ (UIStoryboard *)homePageStoryboard;

/**
 *  分类的storyboard
 */
+ (UIStoryboard *)filterStoryboard;



@end
