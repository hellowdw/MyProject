//
//  WCGoodsRelevant.h
//  MyKitchen
//
//  Created by Mac on 15/10/13.
//  Copyright © 2015年 WoChu. All rights reserved.
//

#import "WCBaseModel.h"

//@class WCGoodsPlan;
@interface WCGoodsRelevant : WCBaseModel

/**
 *  配菜方案
 */
//@property (strong, nonatomic) WCGoodsPlan *goodsPlan;

/**
 *  猜你喜欢
 */
@property (strong, nonatomic) NSArray *userloving;

/**
 *  其他厨友选择
 */
@property (strong, nonatomic) NSArray *ohterUserChoice;


@end
