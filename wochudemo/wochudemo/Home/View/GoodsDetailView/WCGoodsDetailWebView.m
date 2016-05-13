//
//  WCGoodsDetailWebView.m
//  MyKitchen
//
//  Created by wochu on 15/12/14.
//  Copyright © 2015年 WoChu. All rights reserved.
//

#import "WCGoodsDetailWebView.h"
#import <MJRefresh/MJRefresh.h>

BOOL isUpdated;

@implementation WCGoodsDetailWebView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollView.backgroundColor = [WCAPPGlobal backgroundColor];
        self.delegate = self;
    }
    return self;
}

- (void)loadGoodsWebDetailWithElement:(id)element
                          webViewSize:(WebViewSizeBlock)webViewHeight
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (!isUpdated) {
            [RSProgressHUD showWithStatus:@"加载中"];
        }else{
            [RSProgressHUD dismiss];
        }
    });
    NSString *HTMLString = (NSString *)element;
    
    NSMutableString *html = [[NSMutableString alloc] init];
    [html appendString:@"<head>"];
    [html appendString:@"<link type=\"text/css\" rel=\"stylesheet\" href=\"themes/benlai/style2.css\">"];
    [html appendString:@"<link type=\"text/css\" rel=\"stylesheet\" href=\"themes/benlai/style.css\">"];
    
    [html appendString:@"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=1, minimum-scale=1.0, maximum-scale=1.0\" />"];
    
    [html appendString:@"</head>"];
    [html appendString:@"<body>"];
    
    [html appendString:HTMLString ? : @""];
    [html appendString:@"<style type=\"text/css\"> img { max-width:100%;height:auto} table { max-width:100%;}  </style>"];
    [html appendString:@"</body>"];
    
    [self loadHTMLString:html baseURL:nil];
    
    webViewHeight(self.scrollView.contentSize.height);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [RSProgressHUD dismiss];
    isUpdated = YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [RSProgressHUD dismiss];
    isUpdated = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y == 0) {
        
    }
}


@end
