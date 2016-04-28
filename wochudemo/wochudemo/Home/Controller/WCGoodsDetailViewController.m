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
#import "WCBaseTableViewCell.h"
#import "WCGoodsAssessCell.h"
#import "WCGoodsContentCell.h"
#import "WCGoodsCell.h"


#define WCGoodsDetailBottomView_Height 49
#define WCGoodsDetailHeaderView_Height WCScreenWidth + 105

static NSString *__goodsAssessCellIdentifier = @"WCGoodsAssessCell";
static NSString *__goodsContentCellIdentifier = @"WCGoodsContentCell";
static NSString *__goodsCellIdentifier = @"WCGoodsDetailCell";

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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self _setNavigationWithImage:[UIImage new] translucent:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self _setNavigationWithImage:nil translucent:NO];
}

#pragma mark - setup

- (void)setup {
    [self _setTableView];
    [self _loadData];
}

- (void)_setTableView {
    _mScrollView.pagingEnabled = YES;
    _mScrollView.scrollEnabled = NO;
    _mTableView.backgroundView = nil;
    _mTableView.backgroundColor = [WCAPPGlobal backgroundColor];
    self.view.backgroundColor = [WCAPPGlobal backgroundColor];
    _mTableView.frame = CGRectMake(0, 0, WCScreenWidth, WCScreenHeight - WCGoodsDetailBottomView_Height);
    _goodsDetailWebView = [[WCGoodsDetailWebView alloc] initWithFrame:CGRectMake(0, WCScreenHeight, WCScreenWidth, WCScreenHeight)];
    _mTableView.tableHeaderView.frame = CGRectMake(0, 0, WCScreenWidth, WCGoodsDetailHeaderView_Height);
    _mTableView.tableHeaderView = _headerView;
    [_mScrollView addSubview:_mTableView];
    [_mScrollView addSubview:_goodsDetailWebView];
}

- (void)_setNavigationWithImage:(UIImage *)image translucent:(BOOL)isYes {
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:image];
    self.navigationController.navigationBar.translucent = isYes;
}

- (void)_loadData {
    __weak typeof(self) weakSelf = self;
    [weakSelf.mViewModel refreshWithGoodsGuid:_goodsGuid action:^(WCGoods *goods, NSError *error) {
        run(^{
            if (error) {
                [RSProgressHUD showErrorWithStatus:error.errorDescription];
            } else {
                [weakSelf.headerView renderGoodsInfoViewWith:goods];
                [weakSelf.mTableView reloadData];
            }
        });
    }];
    
   [weakSelf.mViewModel refreshAdvertiseWithGoodsGuid:_goodsGuid action:^(NSArray *array, NSError *error) {
       [weakSelf.headerView renderAdvertWithImageUrlArr:array];
   }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDelegate ,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_mViewModel numberOfItemsOrRowsInSction:section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case WCGoodsDetailCellTypeGoodsAssess: {
            return [WCGoodsAssessCell cellHeightWithCell:nil tableView:tableView indexPath:indexPath element:nil];
        }
            break;
        case WCGoodsDetailCellTypeGoodsContent: {
            return [WCGoodsContentCell cellHeightWithCell:nil tableView:tableView indexPath:indexPath element:nil];
        }
            break;
        case WCGoodsDetailCellTypeGuessYouLike:
        case WCGoodsDetailCellTypeOtherFriendChoose: {
            return [WCGoodsCell cellHeightWithCell:nil tableView:tableView indexPath:indexPath element:nil];
        }
            break;
        default:
            return 44;
            break;
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WCBaseTableViewCell *cell = nil;
    switch (indexPath.row) {
        case WCGoodsDetailCellTypeGoodsAssess: {
            WCGoodsAssessCell *assessCell = [tableView dequeueReusableCellWithIdentifier:__goodsAssessCellIdentifier];
            [WCGoodsAssessCell renderCell:assessCell tableView:tableView indexPath:indexPath element:nil];
            assessCell.backgroundColor = [UIColor redColor];
            cell = assessCell;
        }
            break;
        case WCGoodsDetailCellTypeGoodsContent: {
            WCGoodsContentCell *contentCell = [tableView dequeueReusableCellWithIdentifier:__goodsContentCellIdentifier];
            [WCGoodsContentCell renderCell:contentCell tableView:tableView indexPath:indexPath element:[_mViewModel elementForIndexPath:indexPath]];
            cell = contentCell;
        }
            break;
        case WCGoodsDetailCellTypeOtherFriendChoose:
        case WCGoodsDetailCellTypeGuessYouLike: {
            WCGoodsCell *goodsCell = [tableView dequeueReusableCellWithIdentifier:__goodsCellIdentifier];
            [WCGoodsCell renderCell:goodsCell tableView:tableView indexPath:indexPath element:[_mViewModel elementForIndexPath:indexPath]];
            if (indexPath.row == WCGoodsDetailCellTypeOtherFriendChoose) {
                [goodsCell setTitleLabelWithString:@"其他厨友的选择"];
            } else {
                [goodsCell setTitleLabelWithString:@"猜你喜欢"];
            }
            cell = goodsCell;
        }
            break;
        default:
            return cell;
            break;
    }
    return cell;
}

#pragma mark - Web

#pragma mark - Action

- (void)setTargetGoodsGuid:(NSString *)goodsGuid {
    WCAssert(goodsGuid && @"goodsGuid 不能为空");
    _goodsGuid = goodsGuid;
}

//返回
- (IBAction)pressedGoBackLeftButtonItem:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
