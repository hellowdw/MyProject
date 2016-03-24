//
//  WCGoodsActs.h
//  wochudemo
//
//  Created by wochu on 16/3/21.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseModel.h"

@interface WCGoodsActs : WCBaseModel

@property (strong ,nonatomic) NSArray *items; /**WCGoodsAction数据模型*/

@property (assign ,nonatomic) NSInteger templateType;/**模板类型*/

@end
