//
//  WCButton.m
//  wochudemo
//
//  Created by wochu on 16/2/18.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCButton.h"

@interface WCButton ()

@property (assign, nonatomic)CGFloat topMargin;
@property (assign, nonatomic)CGFloat imageScale;

@end

@implementation WCButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self _setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self _setup];
    }
    return self;
}
- (void)_setup {
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    _topMargin = 0;
    _imageScale = 0.7;
}

#pragma 重新定义image的位置

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageX = 0;
    CGFloat imageY = _topMargin;
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = [self getHeight:contentRect] *_imageScale;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleX = 0;
    CGFloat titleY = [self getHeight:contentRect] *_imageScale + _topMargin;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = [self getHeight:contentRect] *(1 - _imageScale);
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (CGFloat)getHeight:(CGRect)contentRect {
    return contentRect.size.height - _topMargin * 2;
}

- (void)setTopMargin:(CGFloat)topMargin {
    _topMargin = topMargin;
    [self setNeedsDisplay];
}

- (void)setImageScale:(CGFloat)imageScale {
    _imageScale = imageScale;
    [self setNeedsDisplay];
}

@end








