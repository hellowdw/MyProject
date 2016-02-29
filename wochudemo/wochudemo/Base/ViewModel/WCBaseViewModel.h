//
//  WCBaseViewModel.h
//  wochudemo
//
//  Created by wochu on 16/2/15.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCObject.h"

typedef void (^WCDoneAction)(NSError *error);

//typedef void (^WCNewSh)(<#arguments#>);


@interface WCBaseViewModel : WCObject
//数据
@property (strong, nonatomic) NSMutableArray *items;

@property (assign, nonatomic) int64_t sinceID;
@property (assign, nonatomic) int64_t maxID;
@property (assign, nonatomic) NSInteger pageCount;
@property (assign, nonatomic) NSInteger page;
//最后一包数据
@property (assign, nonatomic,readonly) NSInteger lastPackageCount;

//默认是1组，如果有特殊情况，请在子类重写
- (NSInteger)numberOfSections;//共有多少组
//每一组共有多少row/items
- (NSInteger)numberOfItemsOrRowsInSction:(NSInteger)section;

- (id)elementForIndexPath:(NSIndexPath *)indexPath;

- (void)refresh:(WCDoneAction)action;
- (void)loadMore:(NSInteger)page count:(NSInteger)count action:(WCDoneAction)action;

- (void)updateIDs;

//设置最后一包数据
- (void)_setLastPackCount:(NSInteger)count;

//是否为空
- (BOOL)isEmpty;

@end





