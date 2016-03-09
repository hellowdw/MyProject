//
//  WCBaseAccess.m
//  wochudemo
//
//  Created by wochu on 16/3/1.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseAccess.h"

static NSString *__tempConfigure = @"client/v1/";

@implementation WCBaseAccess

+ (NSString *)assembleURLString:(NSString *)URLString {
    return [NSString stringWithFormat:@"%@%@",__tempConfigure,URLString];
}


#pragma mark - get和post
+ (NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(id)parameters action:(void (^)(NSURLSessionDataTask *, id, NSError *))action {
    NSURLSessionDataTask *dataTask = [self GET:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error = [self _verifyResponseObject:responseObject];
        if (error) {
            ELog(@"%@",error.localizedDescription);
        }
        action(task,responseObject,error);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        action(task,nil,error);
    }];
    return dataTask;
}

+ (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters action:(void (^)(NSURLSessionDataTask *, id, NSError *))action {
    NSURLSessionDataTask *dataTask = [self GET:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error = [self _verifyResponseObject:responseObject];
        if (error) {
            ELog(@"%@",error.localizedDescription);
        }
        action(task,responseObject,error);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        action(task,nil,error);
    }];
    return dataTask;
}

#pragma mark - 错误处理
+ (NSError *)_verifyResponseObject:(id)responseObject {
    WCAssert([responseObject isKindOfClass:[NSDictionary class]] && @"不是字典。。。");
    if ([responseObject[@"hasError"] integerValue]) {
        NSError *__error = nil;
        if ([responseObject[@"errorCode"] isKindOfClass:[NSNull class]]) {
            __error = [NSError errorWithDomain:@"WCBaseAccessDomain" code:WCServiceErrorCode userInfo:@{NSLocalizedDescriptionKey : responseObject[@"errorMessage"]}];   //不同的错误，给不同的code，用作标识，那些错误可以弹，那些错误不可以弹
        } else {
            __error = [NSError errorWithDomain:@"WCBaseAccessDomain" code:WCRemindErrorCode userInfo:@{NSLocalizedDescriptionKey : responseObject[@"errorMessage"]}];
        }
        return __error;
    }
    return nil;
}

#pragma mark - 字典转为json字符串
+ (NSDictionary *)assembleParameterWithKey:(NSString *)assembleKey parameters:(NSDictionary *)parameters {
    NSMutableString *assembleString = [NSMutableString string];
    
    NSMutableArray *parts = [[NSMutableArray alloc]init];
    for (NSString *key in parameters) {
        id encodeValue = parameters[key];
        //第一种和第二中暂时用不到，可能value不能是dictionary，array，这里写就是为了拓展
        if ([encodeValue isKindOfClass:[NSDictionary class]]) {
            encodeValue = [NSJSONSerialization dataWithJSONObject:encodeValue options:NSJSONWritingPrettyPrinted error:nil];
            encodeValue = [[NSString alloc]initWithData:encodeValue encoding:NSUTF8StringEncoding];
        }
        else if ([encodeValue isKindOfClass:[NSArray class   ]]) {
            encodeValue = [NSJSONSerialization dataWithJSONObject:encodeValue options:NSJSONWritingPrettyPrinted error:nil];
            encodeValue = [[NSString alloc]initWithData:encodeValue encoding:NSUTF8StringEncoding];
        }
        else if ([encodeValue isKindOfClass:[NSString class]]) {
            encodeValue = encodeValue;
        }
        else if ([encodeValue isKindOfClass:[NSNumber class]]) {
            encodeValue = encodeValue;
        }
        else if ([encodeValue isKindOfClass:[NSData class]]) {
            encodeValue = [[NSString alloc]initWithData:encodeValue encoding:NSUTF8StringEncoding];
        }
        
        NSString *encodeKey = [key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        NSString *part = nil;
        if ([encodeValue isKindOfClass:[NSString class]]){
            part = [NSString stringWithFormat:@"\"%@\":\"%@\"",encodeKey,encodeValue];
        } else {
            part = [NSString stringWithFormat:@"\"%@\":%@",encodeKey,encodeValue];
        }
        
        [parts addObject:parts];
    }
    
    [assembleString appendString:@"{"];
    for (NSInteger idx = 0; idx < parts.count; idx ++) {
        [assembleString appendString:parts[idx]];
        if (idx != parts.count - 1) {
            [assembleString appendString:@","];
        }
    }
    [assembleString appendString:@"}"];
    NSString *tempKey = [assembleString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return @{tempKey:assembleString};
}

@end









