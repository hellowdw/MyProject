//
//  WCHomeHeaderView.m
//  wochudemo
//
//  Created by wochu on 16/2/15.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCHomeHeaderView.h"
#import "WCHomeActionView.h"
#import "WCHomeAdvertView.h"
#import "WCHomeNewsView.h"

@interface WCHomeHeaderView ()
@property (weak, nonatomic)IBOutlet WCHomeNewsView *newsView;
@property (weak, nonatomic)IBOutlet WCHomeActionView *actionView;
@property (weak, nonatomic)IBOutlet WCHomeAdvertView *advertView;

@end

@implementation WCHomeHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    [_actionView setActionArray:@[@(1),@(2),@(3),@(4)]];
}

- (void)renderAdverView:(NSArray *)ads {
    [_advertView setAdvertisings:ads];
}

- (void)startAnimation {
    //[_advertView ];
}

- (void)stopAnimation {
    
}

@end
