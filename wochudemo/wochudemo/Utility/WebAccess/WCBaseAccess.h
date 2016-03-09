//
//  WCBaseAccess.h
//  wochudemo
//
//  Created by wochu on 16/3/1.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseWebService.h"

@interface WCBaseAccess : WCBaseWebService


/**
 *  内部检测数据是否有错， 对WCBaseWebService的又一次封装
 */
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters action:(void (^)(NSURLSessionDataTask *task, id responeObject, NSError *error))action;

/**
 *  内部检测数据是否有错， 对WCBaseWebService的又一次封装
 */
+ (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters action:(void(^)(NSURLSessionDataTask *task,id responeObject,NSError *error))action;



@end
