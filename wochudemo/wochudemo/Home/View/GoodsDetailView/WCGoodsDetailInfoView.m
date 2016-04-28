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

@property (strong, nonatomic) WCGoods *goods;
@property (strong, nonatomic) NSArray *imageViewArray;

@end


@implementation WCGoodsDetailInfoView

- (void)awakeFromNib {
    _imageViewArray = @[_firstImageView,_secondImageView,_thirdImageView];
    _firstImageView.hidden = YES;
    _secondImageView.hidden = YES;
    _thirdImageView.hidden = YES;
}

- (void)renderGoodsInfoViewWithGoods:(WCGoods *)goods {
    _goods = goods;
    _nameLabel.text = goods.goodsName ? : @"";
    _alisaNameLabel.text = goods.alias ? : @"";
    _ruleLabel.text = goods.promotedAmount ? : @"";
    [_setpper setMaximum:goods.goodsStock ? : 100];
    [self _updatePriceWithCount:1 isUpdatePrice:YES];
    __weak typeof(self) weakSelf = self;
    _setpper.valueChangedCallback = ^(PKYStepper *stepper,float count) {
        [weakSelf _updatePriceWithCount:count isUpdatePrice:NO];
    };
    
    for (NSInteger idx = 0; idx < goods.goodsAttributeImg.count; idx ++) {
        if (idx > _imageViewArray.count - 1) {
            return;
        }
        UIImageView *imageView = _imageViewArray[idx];
        NSString *imageName = [NSString stringWithFormat:@"home_goods_free_%@",goods.goodsAttributeImg[idx]];
        imageView.image = [UIImage imageNamed:imageName];
        imageView.hidden = NO;
    }
    
    //隐藏多余的imageView
    for (NSInteger idx = goods.goodsAttributeImg.count; idx < _imageViewArray.count; idx ++ ) {
        UIImageView *imageView = _imageViewArray[idx];
        imageView.hidden = YES;
    }
    
    
}


- (void)_updatePriceWithCount:(NSInteger)count isUpdatePrice:(BOOL)isUpdatePrice {
    if (isUpdatePrice) {
        _priceLabel.text = [NSString stringWithFormat:@"￥%.2f",(_goods.price*count)];
        _oldPriceNameLabel.hidden = _goods.price == _goods.marketPrice;
        NSString *marketPriceString = [NSString stringWithFormat:@"￥%.2f",(_goods.marketPrice*count)];
        _oldPriceNameLabel.attributedText = [[NSAttributedString alloc]initWithString:marketPriceString attributes:WCMarketPriceAttributes];
    }
    _goods.cnt = count;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
