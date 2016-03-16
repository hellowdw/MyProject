//
//  WCBaseViewModel.m
//  wochudemo
//
//  Created by wochu on 16/2/15.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//
#import "WCBaseViewModel.h"
#import "Macros.h"

@implementation WCBaseViewModel

- (instancetype)init {
    if (self = [super init]) {
        _items = [NSMutableArray array];
    }
    return self;
}

- (NSInteger)numberOfSections {
    return 1;
}

- (NSInteger)numberOfItemsOrRowsInSction:(NSInteger)section {
    return _items.count;
}

- (id)elementForIndexPath:(NSIndexPath *)indexPath {
    id item = nil;
    if (indexPath.row >= _items.count) {
        ELog(@"数组越界");
    } else {
        item = _items[indexPath.row];
    }
    return item;
}

#pragma mark - Action

- (void)refresh:(WCDoneAction)action {
    _lastPackageCount = 0;
    _sinceID = 0;
    _maxID = 0;
    _page = 1;
    [self loadMore:1 action:action];
}

- (void)loadMore:(NSInteger)page action:(WCDoneAction)action {
    [self loadMore:page count:[self pageCount] action:action];
}

- (void)loadMore:(NSInteger)page count:(NSInteger)count action:(WCDoneAction)action {
    [self setPage:page];
}

- (NSInteger)pageCount {
    if (_pageCount == 0) {
        return 20;
    }
    return _pageCount;
}

- (void)_setLastPackCount:(NSInteger)count {
    _lastPackageCount = count;
}

- (BOOL)isEmpty {
    return self.items.count == 0;
}


@end








