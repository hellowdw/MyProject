//
//  Enum.h
//  wochudemo
//
//  Created by wochu on 16/2/19.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#ifndef Enum_h
#define Enum_h


//首页活动状态
typedef NS_ENUM(NSInteger, WCHomeActionType){
    WCHomeActionTypeUnknown = 0,
    WCHomeActionTypeHot = 1,        //热销
    WCHomeActionTypeCoupon = 2,     //特惠
    WCHomeActionTypeFriend = 3,     //邀好友
    WCHomeActionTypeRecharge = 4,   //充值
    WCHomeActionTypeMore,

};

//typedef enum {
//    WCHomeActionTypeUnknown = 0,
//    WCHomeActionTypeHot = 1,        //热销
//    WCHomeActionTypeCoupon = 2,     //特惠
//    WCHomeActionTypeFriend = 3,    //邀好友
//    WCHomeActionTypeRecharge = 4,   //充值
//    WCHomeActionTypeMore,
//}WcHomeActionType;

typedef NS_ENUM(NSInteger,WCErrorCode) {
    WCRemindErrorCode = -10000,     //提醒错误
    WCServiceErrorCode = -10001,    //服务器错误
    WCLocalErrorCode = -10002,      //本地错误
    WCNetworkErrorCode = -10003,    //网络错误
    WCCrashErrorCode = -10004       //崩溃错误
};

typedef NS_ENUM(NSInteger,WCHomeCellType) {
    WCHomeCellTypeBombGoods = 0,          //第一个cell放的是爆款商品
    WCHomeCellTypeOneImageView = 1,       //只有一个图片的cell
    WCHomeCellTypeTwoImageView = 2,       //有两个图片的cell
    WCHomeCellTypeThreeImageView = 3      //三张图片
};

typedef NS_ENUM(NSInteger,WCGoodsDetailCellType) {
    WCGoodsDetailCellTypeGoodsAssess = 0,      //第一种cell是商品评价
    WCGoodsDetailCellTypeGoodsContent,            //第二种cell是商品详情的描述
    WCGoodsDetailCellTypeGuessYouLike,         //第三种cell是商品相关（猜你喜欢）
    WCGoodsDetailCellTypeOtherFriendChoose     //第三种cell是商品相关（其他好友喜欢）
};




#endif /* Enum_h */
