//
//  WCBaseWebService.h
//  wochudemo
//
//  Created by wochu on 16/3/1.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCObject.h"

typedef void(^WCAccessSuccess)(NSURLSessionDataTask *task,id responseObject);
typedef void(^WCAccessFailure)(NSURLSessionDataTask *task,NSError *error);

@interface WCBaseWebService : WCObject


+ (NSString *)baseURL;

//get请求
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(WCAccessSuccess)success
                      failure:(WCAccessFailure)failure;

//post请求
+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                   parameters:(id)parameters
                      success:(WCAccessSuccess)success
                      failure:(WCAccessFailure)failure;

//登录为Http请求方式，请求完毕后自动改为json方式
+ (void)setOnceRequestHTTPSerailizer;

+ (void)clearTokenHeader;












@end
