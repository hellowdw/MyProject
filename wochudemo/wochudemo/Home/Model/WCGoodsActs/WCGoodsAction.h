//
//  WCGoodsAction.h
//  wochudemo
//
//  Created by wochu on 16/3/18.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseModel.h"

@interface WCGoodsAction : WCBaseModel

@property (copy,nonatomic) NSString *imgUrl; /// 图片链接

@property (copy,nonatomic) NSString *source; /// 来源

@property (assign,nonatomic) NSInteger type; /*配置*/

@property (assign,nonatomic) NSInteger pos; ///

@end
