//
//  WCViewControllerManager.m
//  wochudemo
//
//  Created by wochu on 16/3/24.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCViewControllerManager.h"
#import "WCViewControllerLoader.h"

@implementation WCViewControllerManager

+ (NSArray *)viewControllers {
    UIStoryboard *homePageStoryboard = [WCViewControllerLoader homePageStoryboard];
    UIStoryboard *filterStoryBoard = [WCViewControllerLoader filterStoryboard];
    return @[[homePageStoryboard instantiateInitialViewController],[filterStoryBoard instantiateInitialViewController]];
}

+ (void)changeRootViewController:(UIViewController*)viewController window:(UIWindow *)window {
    if (!window.rootViewController) {
        window.rootViewController = viewController;
        [window makeKeyAndVisible];
        return;
    }
    
    UIView *snapShot = [window snapshotViewAfterScreenUpdates:YES]; //生成快照
    
    UIViewController *replacedVC = window.rootViewController;
    
    [replacedVC willMoveToParentViewController:nil];
    [replacedVC removeFromParentViewController];
    [replacedVC didMoveToParentViewController:nil];
    
    
    
    //    if ([replacedVC isKindOfClass:[UINavigationController class]]) {
    //        UINavigationController *nav = (UINavigationController *)replacedVC;
    //        [nav popToRootViewControllerAnimated:NO];
    //    }
    
    window.rootViewController = viewController;
    [window makeKeyAndVisible];
    
    for (UIView *subview in window.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UITransitionView")]) {
            [subview removeFromSuperview];
        }
    }
    
    // Allow the view controller to be deallocated
    [replacedVC dismissViewControllerAnimated:NO completion:^{
        // Remove the root view in case its still showing
        [replacedVC.view removeFromSuperview];
    }];
    
    [viewController.view addSubview:snapShot];
    
    [UIView animateWithDuration:0.5 animations:^{
        snapShot.layer.opacity = 0;
    } completion:^(BOOL finished) {
        [snapShot removeFromSuperview];
    }];
}

@end
