//
//  WCClassifyViewModel.m
//  wochudemo
//
//  Created by wochu on 16/5/17.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCClassifyViewModel.h"
#import "WCClassifyAccess.h"
#import "WCClassifyModel.h"

@interface WCClassifyViewModel()

@property (strong, nonatomic) NSMutableArray *firstMenuArray; /// 一级分类
@property (strong, nonatomic) NSMutableArray *excludeFirstMenuArray; ///除去一级分类剩下的
@property (strong, nonatomic) NSMutableArray *secondMenuArray;///二级目录分类

@end

@implementation WCClassifyViewModel

- (instancetype)init {
    if (self = [super init]) {
        _firstMenuArray = [NSMutableArray array];
        _secondMenuArray = [NSMutableArray array];
        _excludeFirstMenuArray = [NSMutableArray array];
    }
    return self;
}

/**
 *  拿数据
 */
- (void)refresh:(WCDoneAction)action {
    __weak typeof(self) weakSelf = self;
    [WCClassifyAccess getClassifyListByMenuType:WCClassifyMenuTypeAll action:^(NSArray *array, NSError *error) {
        if (error) {
            action(error);
        } else {
            [weakSelf.items removeAllObjects];
            [weakSelf.items addObjectsFromArray:array];
            [weakSelf _updateFirstMenus];
            return action(nil);
        }
    }];
}

- (NSInteger)numberOfRowsInSction:(NSInteger)section {
    return _firstMenuArray.count;
}

- (NSInteger)numberOfItemsInSction:(NSInteger)section {
    return _secondMenuArray.count;
}

- (WCClassifyModel *)elementForIndexPathInTableView:(NSIndexPath *)indexPath {
    if (indexPath.row >= _firstMenuArray.count) {
        WCAssert(0 && @"数组越界");
    }
    return _firstMenuArray[indexPath.row];
}

- (WCClassifyModel *)elementForIndexPathInCollectonView:(NSIndexPath *)indexPath {
    if (indexPath.row >= _secondMenuArray.count) {
        WCAssert(0 && @"数组越界");
    }
    return _secondMenuArray[indexPath.row];
}

/**
 *  遍历数组
 */
- (void)_updateFirstMenus {
    for (WCClassifyModel *classify in self.items) {
        if (classify.menu == WCClassifyMenuTypeFirst) {
            [_firstMenuArray addObject:classify];
        } else {
            [_excludeFirstMenuArray addObject:classify];
        }
    }
    
    //默认选择第一个
     WCClassifyModel *classifyModel = [_firstMenuArray firstObject];
    [self updateSecondMenus:classifyModel.ID];
}

/**
 * 根据一级目录更新二级目录
 */
- (void)updateSecondMenus:(int64_t)ID {
    [_secondMenuArray removeAllObjects];
    if (_excludeFirstMenuArray.count) {
        for (WCClassifyModel *classifyModel in _excludeFirstMenuArray) {
            if (classifyModel.parentId == ID) {
                [_secondMenuArray addObject:classifyModel];
            }
        }
    }
}

@end
