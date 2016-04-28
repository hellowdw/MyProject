//
//  WCGoodsView.m
//  wochudemo
//
//  Created by wochu on 16/3/14.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCGoodsView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "WCSeparateView.h"

@interface WCGoodsView ()

@property (weak, nonatomic) IBOutlet WCSeparateView *separateView;

@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;  /*缩略图*/
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;           /*名称*/
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;          /*价格*/
@property (weak, nonatomic) IBOutlet UILabel *oldPriceLabel;       /*老价格 */

@property (strong, nonatomic) WCBaseGoods *goods;
@property (assign, nonatomic,getter=isHiddenOldPrice) BOOL hiddenOldPrice;
@property (copy, nonatomic) void(^action)(WCBaseGoods *goods);


@end

@implementation WCGoodsView


+ (instancetype)goodsView {
    WCGoodsView *goodsView = [[[NSBundle mainBundle] loadNibNamed:@"WCGoodsView" owner:nil options:nil] lastObject];
    return goodsView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    _priceLabel.textColor = [WCAPPGlobal orangeColor];
    [self becomeEllipseViewWithBorderColor:[WCAPPGlobal grayColor] borderWidth:0.5 cornerRadius:3.0];
    //_hiddenOldPrice = NO;
    
    [self _setup];
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_pressedGoodsView:)]];
    
}


#pragma mark - 渲染方法

- (void)renderWithGoods:(WCBaseGoods *)goods {
    _goods = goods;
    _nameLabel.text = goods.goodsName ? : (goods.title ? : @"");
    _priceLabel.text = [NSString stringWithFormat:@"￥%.2f",goods.price];
    NSString *marketPriceString = [NSString stringWithFormat:@"￥%.2f",goods.marketPrice];
    _oldPriceLabel.attributedText = [[NSAttributedString alloc] initWithString:marketPriceString attributes:WCMarketPriceAttributes];
    [_thumbImageView sd_setImageWithURL:[NSURL URLWithString:goods.picUrl] placeholderImage:[WCAPPGlobal placeholderImage]];
    _oldPriceLabel.hidden = (goods.price == goods.marketPrice); //价格相等，市场价隐藏
}




- (void)_setup {
    //_oldPriceLabel.hidden = _hiddenOldPrice;
}

- (void)_pressedGoodsView:(UITapGestureRecognizer *)tap {
    if (_action) {
        _action(_goods);
    }
}

- (void)setPressedGoodsViewActon:(void (^)(WCBaseGoods *))action {
    if (action) {
        _action = [action copy];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self setBackgroundColor:[UIColor redColor]];
}

@end
