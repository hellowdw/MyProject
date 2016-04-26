//
//  WCGoodsDetailHeaderView.m
//  wochudemo
//
//  Created by wochu on 16/4/18.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCGoodsDetailHeaderView.h"
#import "WCHomeAdvertView.h"
#import "WCGoodsDetailInfoView.h"
@interface WCGoodsDetailHeaderView ()
@property (weak, nonatomic) IBOutlet WCHomeAdvertView *advertView;
@property (weak, nonatomic) IBOutlet WCGoodsDetailInfoView *goodsDetailInfoView;

@property (strong, nonatomic) WCGoods *goods;

@end

@implementation WCGoodsDetailHeaderView

- (void)renderGoodsInfoViewWith:(WCGoods *)goods {
    _goods = goods;
    [_goodsDetailInfoView renderGoodsInfoViewWithGoods:goods];
}

- (void)renderAdvertWithImageUrlArr:(NSArray *)imageUrlArr {
    [_advertView setAdvertisings:imageUrlArr];
    [_advertView setIsGoodsDetail:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
