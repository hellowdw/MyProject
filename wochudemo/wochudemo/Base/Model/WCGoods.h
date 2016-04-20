//
//  WCGoods.h
//  MyKitchen
//
//  Created by Mac on 15/9/29.
//  Copyright (c) 2015年 WoChu. All rights reserved.
//

#import "WCBaseGoods.h"
#import "WCGoodsRelevant.h"

typedef NS_ENUM(NSInteger, WCShippingType) {
    WCShippingTypeTheDay,
    WCShippingTypeOther
};

@interface WCGoods : WCBaseGoods
/*
 *  保质期
 */
@property (strong, nonatomic) NSString *shelfLife;

/**
 *  产地
 */
@property (strong, nonatomic) NSString *origin1;
@property (strong, nonatomic) NSString *origin2;

/**
 *  制造地
 */
//@property (strong, nonatomic) NSString *gunsmith;

/**
 *  存储条件
 */
@property (strong, nonatomic) NSString *storageCondition;

/**
 *  商品规格
 */
@property (strong, nonatomic) NSString *specification;

/**
 *  描述、简介
 */
@property (strong, nonatomic) NSString *descrip;

/**
 *  配送方式
 */
@property (assign, nonatomic) WCShippingType shippingType;

/**
 *  图文描述 html
 */
@property (strong, nonatomic) id descriptionDetail;

/**
 *  关联信息
 */
@property (strong, nonatomic) WCGoodsRelevant *goodsRelevant;



@end
