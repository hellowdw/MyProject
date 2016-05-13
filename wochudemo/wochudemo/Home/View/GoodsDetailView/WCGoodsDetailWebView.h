//
//  WCGoodsDetailWebView.h
//  MyKitchen
//
//  Created by wochu on 15/12/14.
//  Copyright © 2015年 WoChu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^WebViewSizeBlock) (CGFloat webViewContentHeight);
typedef void (^ScrollToTopRefreshBlock) (void);

@interface WCGoodsDetailWebView : UIWebView<UIWebViewDelegate>

@property (nonatomic,copy)ScrollToTopRefreshBlock topRefreshBlock;

- (void)loadGoodsWebDetailWithElement:(id)element webViewSize:(WebViewSizeBlock)webViewHeight;

@end
