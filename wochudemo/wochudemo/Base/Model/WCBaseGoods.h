//
//  WCBaseGoods.h
//  wochudemo
//
//  Created by wochu on 16/3/7.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#define WCMarketPriceAttributes @{NSFontAttributeName : [UIFont systemFontOfSize:12], NSForegroundColorAttributeName : [UIColor grayColor], NSStrikethroughStyleAttributeName : [NSNumber numberWithInt:1]}

#import "WCBaseModel.h"
@interface WCBaseGoods : WCBaseModel

/**
 *  接口字段不一， 为了适应接口。。，没有办法。
 */
@property (copy, nonatomic) NSString *guid;
@property (copy, nonatomic) NSString *goodsGuid;
// 商品编号
@property (copy, nonatomic) NSString *sn;
@property (copy, nonatomic) NSString *goodsSn;

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *goodsName;
@property (copy, nonatomic) NSString *alias;//商品别名

@property (copy, nonatomic) NSString *title; //title
@property (copy, nonatomic) NSString *goodsTitle; //title

@property (copy, nonatomic) NSString *icon; //图片
@property (copy, nonatomic) NSString *picUrl;

@property (assign, nonatomic) BOOL ischeck;

//具体活动， 暂时没有定模型
@property (strong, nonatomic) NSDictionary *action;

// 真实价
@property (assign, nonatomic) CGFloat realPrice;
// 促销价
@property (assign, nonatomic) CGFloat price;
//市场价格
@property (assign, nonatomic) CGFloat marketPrice;

//赠品中的原始价格
@property (assign, nonatomic) CGFloat originalPrice;

//
@property (assign, nonatomic) CGFloat amount;
@property (copy, nonatomic) NSString *promotedAmount;

//市场价属性
//@property (strong, nonatomic) NSDictionary *marketPriceAttributes;
//库存
@property (assign, nonatomic) NSInteger goodsStock;
//份量
@property (assign, nonatomic) NSInteger weight;
//购买数量
@property (assign, nonatomic) NSInteger cnt;
//规格+重量
@property (copy, nonatomic) NSString *specformat;
//类型（0正常 ，1售罄， 2库存紧张）
@property (nonatomic, assign) NSInteger status;
//
@property (nonatomic, assign) BOOL Virtual;

//是否有库存
@property (nonatomic, assign) BOOL salableStock;

/**
 *    商品属性对应图标（免切)
 */
@property (strong, nonatomic) NSArray *goodsAttributeImg;

/**
 * 促销信息，如，桂冠专区
 */
@property (nonatomic, copy) NSString *promotionTitle;

/**
 *  @param ID        可写0
 *  @param goodsName 商品的goodsGuid
 *  @param price     价格
 *  @param cnt       购买数量
 */
- (instancetype)initWithID:(int64_t)ID goodsGuid:(NSString *)goodsGuid goodsName:(NSString *)goodsName price:(CGFloat)price cnt:(CGFloat)cnt;

@end
