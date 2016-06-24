//
//  WCHomeViewModel.m
//  wochudemo
//
//  Created by wochu on 16/2/15.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCHomeViewModel.h"
#import "WCActivityAccess.h"
#import "WCAdvertising.h"
#import "WCBaseGoods.h"
#import "FMDB.h"

static FMDatabaseQueue *_queue;

@implementation WCHomeViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self _setup];
    }
    return self;
}

#pragma mark - setup
- (void)_setup {
   //0.获取沙盒中的数据库文件名
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"homeCache.sqlite"];
    
    //1.创建队列
    _queue = [FMDatabaseQueue databaseQueueWithPath:path];
    
    //2.创建表
    [_queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"create table if not exists t_home (id integer primary key autoincrement,WCAdvertising blob,WCBaseGoods blob);"];
    }];
    
}

- (void)addHomeCacheDataWithAdvertisings:(NSArray *)advertising baseGoods:(NSArray *)baseGoods {
    for (WCAdvertising *advertis in advertising) {
        [_queue inDatabase:^(FMDatabase *db) {
            //1,获取存储的数据
            NSData *advertisData = [NSKeyedArchiver archivedDataWithRootObject:advertis];
//            NSData *baseGoodsData = [NSKeyedArchiver archivedDataWithRootObject:<#(nonnull id)#>]
            
//            [db executeUpdate:@"insert into t_home (WCAdvertising,WCBaseGoods) values(?,?)",advertisData,];
        }];
    }
}

#pragma mark - ViewModel

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
