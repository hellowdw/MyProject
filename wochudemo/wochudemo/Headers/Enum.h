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



#endif /* Enum_h */
