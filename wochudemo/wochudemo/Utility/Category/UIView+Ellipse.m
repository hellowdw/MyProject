//
//  UIView+Ellipse.m
//  wochudemo
//
//  Created by wochu on 16/3/15.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "UIView+Ellipse.h"

@implementation UIView (Ellipse)

- (void)becomeEllipseViewWithBorderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius {
    
    self.layer.masksToBounds = YES;
    
    self.layer.borderColor = color.CGColor;
    
    self.layer.borderWidth = borderWidth;
    
    self.layer.cornerRadius = cornerRadius;
    
}

@end
