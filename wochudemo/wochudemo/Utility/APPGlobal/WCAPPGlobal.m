//
//  WCAPPGlobal.m
//  wochudemo
//
//  Created by wochu on 16/3/14.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCAPPGlobal.h"

@interface WCAPPGlobal()

@property (strong, nonatomic) UIImage *placeholderImage;

@property (strong, nonatomic) UIColor *orangeColor;
@property (strong, nonatomic) UIColor *grayColor;
@property (strong, nonatomic) UIColor *greenColor;


@end

@implementation WCAPPGlobal

+ (WCAPPGlobal *)defaultAppGlobal {
    static WCAPPGlobal *appGlobal = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appGlobal = [[WCAPPGlobal alloc]init];
    });
    return appGlobal;
}

- (instancetype)init {
    if (self = [super init]) {
        _placeholderImage = [UIImage imageNamed:@"image_placeholder"];
        
        _orangeColor = RGB(236.0, 105.0, 41.0);
        _grayColor = [UIColor colorWithWhite:100.0/255.0 alpha:0.2];
        _greenColor = RGB(85.0, 186.0, 66.0);
    }
    return self;
}

/**
 *  占位图
 */
+ (UIImage *)placeholderImage {
    return [[WCAPPGlobal defaultAppGlobal] placeholderImage];
}

+ (UIColor *)orangeColor {
    return [[WCAPPGlobal defaultAppGlobal] orangeColor];
}

+ (UIColor *)grayColor {
    return [[WCAPPGlobal defaultAppGlobal] grayColor];
}

+ (UIColor *)greenColor {
    return [[WCAPPGlobal defaultAppGlobal] greenColor];
}

@end
