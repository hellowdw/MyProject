//
//  WCHomeActionView.m
//  wochudemo
//
//  Created by wochu on 16/2/18.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCHomeActionView.h"
#import "WCButton.h"

@interface WCHomeActionView ()
// 活动数组
@property (strong, nonatomic)NSArray *actionArray;

@property (strong, nonatomic)IBOutletCollection(UIButton) NSArray *buttonArray;

@end

@implementation WCHomeActionView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    for (WCButton *button in _buttonArray) {
        button.hidden = YES;
        [button setTopMargin:WCButtonTopMargin];
        [button setImageScale:WCButtonImageScale];
    }
    
    for (NSInteger indx = 0;indx < _buttonArray.count; indx ++) {
        WCButton *button = _buttonArray[indx];
        button.hidden = NO;
        button.tag = [_actionArray[indx] integerValue];
        [self _setButtonImageWithButton:button type:button.tag];
    }
    
}

- (void)setActionArray:(NSArray *)actionArray {
    WCAssert(actionArray && @"这个数组不能为空");
    _actionArray = actionArray;
}

- (void)_setButtonImageWithButton:(WCButton *)button type:(WCHomeActionType)type {
    NSString *imageName = nil;
    NSString *titleName = nil;
    switch (type) {
        case WCHomeActionTypeHot:
            imageName = @"home_button_hot_default";
            titleName = @"热销";
            break;
        case WCHomeActionTypeCoupon:
            imageName = @"home_button_sale_default";
            titleName = @"特惠";
            break;
        case WCHomeActionTypeFriend:
            imageName = @"home_button_invatesfriends_default";
            titleName = @"邀好友";
            break;
        case WCHomeActionTypeRecharge:
            imageName = @"home_button_money_default";
            titleName = @"充值";
            break;
        default:
            break;
    }
    
    [button setTitle:titleName forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

@end


















