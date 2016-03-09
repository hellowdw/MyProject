//
//  WCBaseWebService.m
//  wochudemo
//
//  Created by wochu on 16/3/1.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseWebService.h"
#import "VersionControl.h"

@interface WCBaseWebService ()

@property (strong, nonatomic) AFHTTPSessionManager *manager;

@property (strong, nonatomic) AFJSONRequestSerializer *JSONRequestSerializer;

@property (strong, nonatomic) AFHTTPRequestSerializer *HTTPRequestSerializer;

@end

@implementation WCBaseWebService

#pragma mark - get post 请求

+ (NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(id)parameters success:(WCAccessSuccess)success failure:(WCAccessFailure)failure {
    NSURLSessionDataTask *dataTask = [[[self _shareService] manager] GET:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [self debugWithResponseObject:responseObject];
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
    }];
    return dataTask;
}

+ (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters success:(WCAccessSuccess)success failure:(WCAccessFailure)failure {
    NSURLSessionDataTask *dataTask = [[[self _shareService] manager] POST:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [self debugWithResponseObject:responseObject];
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
    }];
    return dataTask;
}

#pragma mark - debug 打印数据

+ (void)debugWithResponseObject:(id)responseObject {
#ifdef DEBUG
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:0 error:nil];
        NSString *dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        DLog(@"%@",dataString);
    }
#endif
}

#pragma mark - 请求头

+ (NSString *)baseURL {
    return WCBaseConnectorAddress;
}

#pragma mark - Init

- (instancetype)init {
    if (self = [super init]) {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:WCBaseConnectorAddress] sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        NSLog(@"%@",WCBaseConnectorAddress);
        //声明请求的数据是json类型
        _manager.requestSerializer = [self JSONRequestSerializer];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
        _manager.requestSerializer.timeoutInterval = 20;
        _manager.responseSerializer.acceptableStatusCodes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(200, 200)];
        _manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    }
    return self;
}

#pragma mark - 设置初始化

- (AFJSONRequestSerializer *)JSONRequestSerializer {
    if (!_JSONRequestSerializer) {
        _JSONRequestSerializer = [AFJSONRequestSerializer serializer];
    }
    return _JSONRequestSerializer;
}

- (AFHTTPRequestSerializer *)HTTPRequestSerializer {
    if (!_HTTPRequestSerializer) {
        _HTTPRequestSerializer = [AFHTTPRequestSerializer serializer];
    }
    return _HTTPRequestSerializer;
}

+ (instancetype)_shareService {
    static WCBaseWebService *_service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _service = [[WCBaseWebService alloc] init];
    });
    return _service;
}

+ (void)setOnceRequestHTTPSerailizer {
    [[self _shareService] manager].requestSerializer = [[self _shareService] HTTPRequestSerializer];
}

+ (void)clearTokenHeader {
    [[[[self _shareService] manager] requestSerializer] clearAuthorizationHeader];
}

@end
















