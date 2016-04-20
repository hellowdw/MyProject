//
//  WCGoodsDetailInfoView.m
//  wochudemo
//
//  Created by wochu on 16/4/18.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCGoodsDetailInfoView.h"
#import "WCSetpper.h"

@interface WCGoodsDetailInfoView()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *alisaNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ruleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *oldPriceNameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *firstImageView; //三个图标位置不固定
@property (weak, nonatomic) IBOutlet UIImageView *secondImageView;
@property (weak, nonatomic) IBOutlet UIImageView *thirdImageView;
@property (weak, nonatomic) IBOutlet WCSetpper *setpper;


@end


@implementation WCGoodsDetailInfoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
