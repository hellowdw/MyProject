//
//  WCSetpper.m
//  MyKitchen
//
//  Created by Mac on 15/9/30.
//  Copyright © 2015年 WoChu. All rights reserved.
//

#import "WCSetpper.h"

@implementation WCSetpper

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.valueChangeNeedRequest = NO;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.value = 1;
    self.stepInterval = 1.0;
    self.minimum = 1;
    self.buttonWidth = 30.0;
    [self setBorderColor:[UIColor grayColor]];
    [self setBorderWidth:0.5];
    [self setButtonTextColor:[UIColor colorWithRed:82/255.0 green:82/255.0 blue:82/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self setCornerRadius:self.bounds.size.height / 2 - 5];
    [self setLabelTextColor:[UIColor blackColor]];
    [self setLabelBackgroundColor:[UIColor whiteColor]];
    [self setButtonBackgroundColor:[UIColor colorWithRed:244/255.0 green:240/255.0 blue:234/255.0 alpha:1.0]];
    [self setButtonFont:[UIFont boldSystemFontOfSize:19]];
    [self setup];
}

#pragma mark event handler
- (void)incrementButtonTapped:(id)sender
{
    if (self.value < self.maximum)
    {
        if (!self.valueChangeNeedRequest) {
            self.value += self.stepInterval;
        }
        if (self.incrementCallback)
        {
            self.incrementCallback(self, self.value);
        }
    }
}

- (void)decrementButtonTapped:(id)sender
{
    if (self.value > self.minimum)
    {
        if (!self.valueChangeNeedRequest) {
            self.value -= self.stepInterval;
        }
        if (self.decrementCallback)
        {
            self.decrementCallback(self, self.value);
        }
    }
}

@end
