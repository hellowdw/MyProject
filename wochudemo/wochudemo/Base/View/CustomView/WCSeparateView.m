//
//  WCSeparateView.m
//  wochudemo
//
//  Created by wochu on 16/2/18.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCSeparateView.h"

@implementation WCSeparateView

- (void)drawRect:(CGRect)rect {
    CGContextRef cxt = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(cxt, 1);
    if (_bgColor) {
        [_bgColor set];
    } else {
        [[UIColor blackColor] set];
    }
    CGContextMoveToPoint(cxt, 0, rect.size.height);
    CGContextAddLineToPoint(cxt, rect.size.width, rect.size.height);
}

- (void)setBgColor:(UIColor *)bgColor {
    _bgColor = bgColor;
    [self setNeedsDisplay];
}

- (void)setBgColor:(UIColor *)bgColor alpha:(CGFloat)alpha {
    self.alpha = alpha;
    [self setBgColor:bgColor];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.alpha = 0.2;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.alpha = 0.2;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
@end
