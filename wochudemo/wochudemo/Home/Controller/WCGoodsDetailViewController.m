//
//  WCGoodsDetailViewController.m
//  wochudemo
//
//  Created by wochu on 16/4/15.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCGoodsDetailViewController.h"
#import "WCGoodsDetailHeaderView.h"
#import "WCGoodsDetailViewModel.h"
#import "WCGoodsDetailWebView.h"

#define WCGoodsDetailBottomView_Height 49
#define WCGoodsDetailHeaderView_Height WCScreenWidth + 105

@interface WCGoodsDetailViewController ()<UITableViewDataSource,UITableViewDelegate, UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet WCGoodsDetailViewModel *mViewModel;
@property (weak, nonatomic) IBOutlet UIScrollView *mScrollView;
@property (strong, nonatomic) IBOutlet UITableView *mTableView;
@property (weak, nonatomic) IBOutlet WCGoodsDetailHeaderView *headerView;

@property (strong, nonatomic) WCGoodsDetailWebView *goodsDetailWebView;
@property (copy, nonatomic) NSString *goodsGuid;

@end

@implementation WCGoodsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    // Do any additional setup after loading the view.
}

#pragma mark - setup

- (void)setup {
    [self _setNavigation];
    [self _setTableView];
}

- (void)_setTableView {
    _mScrollView .scrollEnabled = NO;
    _mTableView.frame = CGRectMake(0, 0, WCScreenWidth, WCScreenHeight - WCGoodsDetailBottomView_Height);
    _goodsDetailWebView = [[WCGoodsDetailWebView alloc] initWithFrame:CGRectMake(0, WCScreenHeight, WCScreenWidth, WCScreenHeight)];
    _mTableView.tableHeaderView = _headerView;
    [_headerView setFrame:CGRectMake(0, 0, WCScreenWidth, WCGoodsDetailHeaderView_Height)];
    [_mScrollView addSubview:_mTableView];
    [_mScrollView addSubview:_goodsDetailWebView];
}

- (void)_setNavigation {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.translucent = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDelegate ,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_mViewModel numberOfItemsOrRowsInSction:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - Web

#pragma mark - Action

- (void)setTargetGoodsGuid:(NSString *)goodsGuid {
    WCAssert(goodsGuid && @"goodsGuid 不能为空");
    _goodsGuid = goodsGuid;
}

//返回
- (IBAction)pressedGoBackLeftButtonItem:(id)sender {
}

//进入购物车
- (IBAction)pressedGoToGoodsCartRightButtonItem:(id)sender {
}

//分享
- (IBAction)pressedShareButton:(id)sender {
    
}

//收藏
- (IBAction)pressedCollectionsButton:(id)sender {
    
}

//加入购物车
- (IBAction)pressedAddGoodsCartButton:(id)sender {
    
}



#pragma mark - Navigation

/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
