//
//  WCBaseModel.h
//  wochudemo
//
//  Created by wochu on 16/3/7.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCObject.h"
#import <MJExtension/MJExtension.h>

@interface WCBaseModel : WCObject

@property (assign, nonatomic) int64_t ID;

@property (assign, nonatomic) int64_t count;

@property (assign, nonatomic, getter=isEnabled) BOOL enabled;

- (instancetype)initWithID:(int64_t)ID;

@end
