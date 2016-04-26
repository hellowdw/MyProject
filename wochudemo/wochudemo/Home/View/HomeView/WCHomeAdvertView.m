//
//  WCHomeAdvertView.m
//  wochudemo
//
//  Created by wochu on 16/2/18.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCHomeAdvertView.h"
#import "WCImageView.h"
#import "WCAdvertising.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface WCHomeAdvertView ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray *imageViews;
@property (strong, nonatomic) UIPageControl *pageControl;

@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSTimeInterval interval;
@property (assign, nonatomic) NSInteger currentPage;
@property (assign, nonatomic) BOOL isGoodsDetail;

@end

@implementation WCHomeAdvertView

- (void)dealloc {
    [self _stopTimer];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self _setup];
    }
    return self;
}

- (void)setAdvertisings:(NSArray *)ads {
    if (ads.count) {
        NSMutableArray *picUrl = [NSMutableArray array];
        for (WCAdvertising *advert in ads) {
            if (advert.picUrl.length) {
                [picUrl addObject:advert.picUrl];
            }
        }
        [self _setAvertImagesOrUrls:picUrl];
    }
}

- (void)_setAvertImagesOrUrls:(NSArray *)picUrls {
    if (!picUrls.count) {
        return;
    }
    
    // 每次刷新，都会调用，所以需要删除
    [_imageViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_imageViews removeAllObjects];
    [self _stopTimer];
    
    for (NSInteger idx = 0; idx < picUrls.count + 2; idx ++) {
        WCImageView *imageView = [[WCImageView alloc] init];
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clickImageView:)]];
        if (idx == 0) {
            [self _imageView:imageView loadImage:[picUrls  lastObject]];
            imageView.tag = picUrls.count;
        } else if (idx == picUrls.count + 1) {
            [self _imageView:imageView loadImage:[picUrls firstObject]];
            imageView.tag = 0;
        } else {
            [self _imageView:imageView loadImage:picUrls[idx - 1]];
            imageView.tag = idx - 1;
        }
        
        
        [_scrollView addSubview:imageView];
        [_imageViews addObject:imageView];
    }
    _pageControl.numberOfPages = _imageViews.count - 2;
    _pageControl.currentPage = 0;
    [self _setupFrame];
    
    if (picUrls.count < 2) {
        return;
    }
    if (!_isGoodsDetail) {
        [self _startTimer];
    }
}

- (void)_imageView:(WCImageView *)imageView loadImage:(id)image {
    [imageView sd_cancelCurrentImageLoad];
    if ([image isKindOfClass:[NSString class]]) {
        NSString *imageUrlString = image;
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:[WCAPPGlobal placeholderImage]];
    } else if ([image isKindOfClass:[NSURL class]]) {
        NSURL *imageURL = image;
        [imageView sd_setImageWithURL:imageURL placeholderImage:[WCAPPGlobal placeholderImage]];
    } else if ([image isKindOfClass:[UIImage class]]) {
        imageView.image = image;
    } else {
        WCAssert (0 && @"image错误");
    }
}

#pragma mark - action

- (void)_clickImageView:(UITapGestureRecognizer *)tap {
    
}

- (void)startAnimation {
    [self _startTimer];
}

- (void)stopAnimation {
    [self _stopTimer];
}



- (void)_startAnimation:(NSTimer *)timer {
   run(^{
       _currentPage += 1;
       [_scrollView setContentOffset:CGPointMake(_scrollView.bounds.size.width *_currentPage,0) animated:YES];
   });
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //当展示最后一个的时候
    _currentPage = scrollView.contentOffset.x / scrollView.bounds.size.width;
    if (scrollView.contentOffset.x / scrollView.bounds.size.width >= (_imageViews.count - 1)) {
        [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width, 0) animated:NO];
        _currentPage = 1;
    }
    
    //显示位置为0，0的时候
    if (scrollView.contentOffset.x <= 0) {
        [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width *(_imageViews.count - 2), 0) animated:NO];
        _currentPage = _imageViews.count - 2;
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    _pageControl.currentPage = _scrollView.contentOffset.x / _scrollView.frame.size.width - 1;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self _stopTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _pageControl.currentPage = _scrollView.contentOffset.x / _scrollView.frame.size.width - 1;
    });
    if (!_isGoodsDetail) {
        [self _startTimer];
    }}


#pragma mark - setup

- (void)_startTimer {
    if (!_timer) {
        [self _stopTimer];
        _timer = [NSTimer timerWithTimeInterval:_interval target:self selector:@selector(_startAnimation:) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

- (void)_stopTimer {
    [_timer invalidate];
    _timer = nil;
}

- (void)_setupFrame {
    _scrollView.frame = self.bounds;
    _scrollView.contentSize = CGSizeMake(_imageViews.count * _scrollView.bounds.size.width, 0);
    _scrollView.contentOffset = CGPointMake(_scrollView.bounds.size.width, 0);
    
    _pageControl.frame = CGRectMake(0, 0, 100, 20);
    _pageControl.center = CGPointMake(self.center.x, self.bounds.size.height - _pageControl.bounds.size.height + 10);
    
    for (NSInteger idx = 0; idx < _imageViews.count; idx ++) {
        UIImageView *imageView = _imageViews[idx];
        imageView.frame = CGRectMake(idx * self.bounds.size.width, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height);
    }
    
}

- (void)_setup {
    _interval = 3.0;
    _isGoodsDetail = NO;
    [_imageViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _imageViews = [NSMutableArray array];
    
    _currentPage = 1;
    
    [_scrollView removeFromSuperview];
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    _scrollView.scrollsToTop = NO;
    [self addSubview:_scrollView];
    
    [_pageControl removeFromSuperview];
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.pageIndicatorTintColor = WCHomeAdPageColor;
    _pageControl.currentPageIndicatorTintColor = WCHomeAdCurrentPageColor;
    [self addSubview:_pageControl];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self _setupFrame];
}

- (void)setIsGoodsDetail:(BOOL)isGoodsDetail {
    _isGoodsDetail = isGoodsDetail;
}

@end


















