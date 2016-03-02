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
















