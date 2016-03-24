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

- (NSInteger)numberOfItemsOrRowsInSction:(NSInteger)section {
    return self.items.count + 1;
}

- (id)elementForIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row > self.items.count) {
        WCAssert (0 && @"数组越界");
        return nil;
    }else if (indexPath.row != 0) {
        return self.items[indexPath.row - 1];
    }
    return nil;
}

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
    
    [WCActivityAccess getGoodsActsAction:^(NSArray *array, NSError *error) {
        if (error) {
            action (error);
        } else {
            [weakSelf.items removeAllObjects];
            [weakSelf.items addObjectsFromArray:array];
            action(nil);
        }
    }];
}

@end
