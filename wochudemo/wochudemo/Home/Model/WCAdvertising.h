//
//  WCAdvertising.h
//  wochudemo
//
//  Created by wochu on 16/3/7.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseModel.h"

@interface WCAdvertising : WCBaseModel

@property (copy, nonatomic)NSString *url;

@property (copy, nonatomic)NSString *picUrl;

@property (copy, nonatomic)NSString *title;

/**
 *  里面有两个类型，去data里面的type
 */
@property (assign, nonatomic)NSInteger type;

@property (copy, nonatomic)NSString *target;

@property (strong, nonatomic)id action;

@end
