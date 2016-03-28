//
//  WCViewControllerManager.h
//  wochudemo
//
//  Created by wochu on 16/3/24.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCObject.h"

@interface WCViewControllerManager : WCObject

+ (NSArray *)viewControllers;

+ (void)changeRootViewController:(UIViewController*)viewController window:(UIWindow *)window;

@end
