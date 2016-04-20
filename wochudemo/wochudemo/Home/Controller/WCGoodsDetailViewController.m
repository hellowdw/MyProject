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

@interface WCGoodsDetailViewController ()
@property (strong, nonatomic) IBOutlet WCGoodsDetailViewModel *mViewModel;

@property (weak, nonatomic) IBOutlet UIScrollView *mScrollView;
@property (strong, nonatomic) IBOutlet UITableView *mTableView;
@property (weak, nonatomic) IBOutlet WCGoodsDetailHeaderView *headerView;

@end

@implementation WCGoodsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action

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
