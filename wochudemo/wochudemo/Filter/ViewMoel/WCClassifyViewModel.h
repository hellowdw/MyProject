//
//  WCClassifyViewModel.h
//  wochudemo
//
//  Created by wochu on 16/5/17.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseViewModel.h"
#import "WCClassifyModel.h"

@interface WCClassifyViewModel : WCBaseViewModel

- (void)updateSecondMenus:(int64_t)ID;

- (NSInteger)numberOfRowsInSction:(NSInteger)section;

- (NSInteger)numberOfItemsInSction:(NSInteger)section;

- (WCClassifyModel *)elementForIndexPathInTableView:(NSIndexPath *)indexPath;

- (WCClassifyModel *)elementForIndexPathInCollectonView:(NSIndexPath *)indexPath;

@end
