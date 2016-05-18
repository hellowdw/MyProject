//
//  WCClassifyModel.h
//  wochudemo
//
//  Created by wochu on 16/5/17.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseModel.h"

typedef NS_ENUM(NSInteger,WCClassifyMenuType) {
    WCClassifyMenuTypeAll = 0,   //目录的级数
    WCClassifyMenuTypeFirst,
    WCClassifyMenuTypeSecond,
    WCClassifyMenuTypeThird
};

@interface WCClassifyModel : WCBaseModel

@property (assign, nonatomic) int64_t parentId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *displayIndex;
/**
 *  描述， 暂时没有用到， 且后台字段不一样
 */
@property (strong, nonatomic) NSString *introduction;
@property (strong, nonatomic) NSString *path;
@property (strong, nonatomic) NSString *checkicon; //选中图
@property (strong, nonatomic) NSString *uncheckicon; //未选择
@property (assign, nonatomic) NSInteger menu; //菜单等级

@property (assign, nonatomic, getter=isSelected) BOOL selected;
@end
