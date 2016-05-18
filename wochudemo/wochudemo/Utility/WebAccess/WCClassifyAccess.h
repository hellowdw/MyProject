//
//  WCClassifyAccess.h
//  wochudemo
//
//  Created by wochu on 16/5/17.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseAccess.h"
#import "WCClassifyModel.h"

@interface WCClassifyAccess : WCBaseAccess

/**
 * 获取分类数据
 */
+ (void)getClassifyListByMenuType:(WCClassifyMenuType)menuType action:(WCCommonAction)action;

@end
