//
//  WCViewControllerLoader.m
//  wochudemo
//
//  Created by wochu on 16/3/24.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCViewControllerLoader.h"

@implementation WCViewControllerLoader

#pragma mark - storyBoard

+ (UIStoryboard *)homePageStoryboard {
    static UIStoryboard *storyBoard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        storyBoard = [UIStoryboard storyboardWithName:@"WCHomePage" bundle:nil];
    });
    return storyBoard;
}

+ (UIStoryboard *)filterStoryboard {
    static UIStoryboard *storyBoard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        storyBoard = [UIStoryboard storyboardWithName:@"WCFilter" bundle:nil];
    });
    return storyBoard;
}

@end
