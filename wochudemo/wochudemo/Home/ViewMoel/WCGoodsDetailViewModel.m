//
//  WCGoodsDetailViewModel.m
//  wochudemo
//
//  Created by wochu on 16/4/20.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCGoodsDetailViewModel.h"
#import "WCActivityAccess.h"

@interface WCGoodsDetailViewModel()

@property (strong, nonatomic) WCGoods *goods;
@property (strong, nonatomic) WCGoodsRelevant *goodsRelevant;

@end


@implementation WCGoodsDetailViewModel

- (id)elementForIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case WCGoodsDetailCellTypeGoodsAssess:
            return nil;
            break;
        case WCGoodsDetailCellTypeGoodsContent:
            return _goods;
            break;
        case WCGoodsDetailCellTypeGuessYouLike:
            return _goodsRelevant.userloving;
            break;
        case WCGoodsDetailCellTypeOtherFriendChoose:
            return _goodsRelevant.ohterUserChoice;
            break;
        default:
            return nil;
            break;
    }
}

- (NSInteger)numberOfItemsOrRowsInSction:(NSInteger)section {
    return 3;
}

- (void)refreshAdvertiseWithGoodsGuid:(NSString *)goodsGuid action:(WCCommonAction)action {
    return [WCActivityAccess getGoodsAdvertiseWithGoodsGuid:goodsGuid action:action];
}

- (void)refreshWithGoodsGuid:(NSString *)goodsGuid action:(void (^)(WCGoods *, NSError *))action {
    __weak typeof(self) weakSelf = self;
    [WCGoodsAccess getGoodsDetailWithGoodsGuid:goodsGuid action:^(WCGoods *goods, NSError *error) {
        if (error) {
            return action(nil,error);
        } else {
            weakSelf.goods = goods;
            return action(goods,nil);
        }
    }];
    
    [WCGoodsAccess getGoodsRelecentWithGoodsGuid:goodsGuid action:^(WCGoodsRelevant *goodsReleVant, NSError *error) {
        if (error) {
            return action(nil,error);
        } else {
            weakSelf.goodsRelevant = goodsReleVant;
            return action(weakSelf.goods,nil); //这地方造成了两次刷新，数据应该写成一个接口
        }
    }];
}

@end
