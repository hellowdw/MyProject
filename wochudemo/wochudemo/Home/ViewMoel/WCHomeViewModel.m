//
//  WCHomeViewModel.m
//  wochudemo
//
//  Created by wochu on 16/2/15.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCHomeViewModel.h"
#import "WCActivityAccess.h"

@implementation WCHomeViewModel

- (void)loadMore:(NSInteger)page count:(NSInteger)count action:(WCDoneAction)action {
    [super loadMore:page count:count action:action];
    __weak typeof(self) weakSelf = self;
    [WCActivityAccess getHomeLayoutWithPage:page count:count action:^(NSArray *ads, NSArray *goods, NSError *error) {
        if (error) {
            action(error);
        } else {
            weakSelf.goods = goods;
            weakSelf.advertisings = ads;
            action(nil);
        }
    }];
}

@end
