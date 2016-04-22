//
//  WCHomeViewController.m
//  wochudemo
//
//  Created by wochu on 16/2/15.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCHomeViewController.h"
#import "WCHomeViewModel.h"
#import "WCHomeHeaderView.h"
#import "WCHomeTitleView.h"
#import "WCGoodsActivityProgram1Cell.h"
#import "WCGoodsActivityProgram2Cell.h"
#import "WCGoodsActivityProgram3Cell.h"
#import <MJRefresh/MJRefresh.h>
#import "WCGoodsCell.h"
#import "WCGoodsActs.h"

static NSString *__goodsCellIdentifier = @"WCGoodsCell";
static NSString *__program1CellIdentifier = @"WCGoodsActivityProgram1Cell";
static NSString *__program2CellIdentifier = @"WCGoodsActivityProgram2Cell";
static NSString *__program3CellIdentifier = @"WCGoodsActivityProgram3Cell";



@interface WCHomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet WCHomeHeaderView *mHomeHeaderView;
@property (weak, nonatomic) IBOutlet WCHomeTitleView *mHomeTitleView;
@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (strong, nonatomic) IBOutlet WCHomeViewModel *mViewModel;

@end

@implementation WCHomeViewController

- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setup];
    
    [self _setupData];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_mHomeHeaderView startAnimation];
}

- (void)viewDidDisappear:(BOOL)animated {
    [_mHomeHeaderView stopAnimation];
}

#pragma mark - setup

- (void)_setup {
    
}

- (void)_setupData {
    self.mTableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self _refresh];
    }];
    [self.mTableView.header beginRefreshing];
}

- (void)_refresh {
    __weak typeof(self) weakSelf = self;
    [weakSelf.mViewModel refresh:^(NSError *error) {
        run(^{
            [weakSelf.mTableView.header endRefreshing];
            [weakSelf.mTableView reloadData];
            if (error) {
                //[
            } else {
            [weakSelf.mHomeHeaderView renderAdverView:weakSelf.mViewModel.advertisings];
            }
        });
    }];
    
    
    
    
    
    [_mHomeHeaderView startAnimation];
    

}


#pragma  TableViewDelegate&DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_mViewModel numberOfItemsOrRowsInSction:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    __weak typeof(self) weakSelf = self;
    switch (indexPath.row) {
        case WCHomeCellTypeBombGoods:{
            WCGoodsCell * cell = [tableView dequeueReusableCellWithIdentifier:__goodsCellIdentifier forIndexPath:indexPath];
            [WCGoodsCell renderCell:cell tableView:tableView indexPath:indexPath element:_mViewModel.goods];
//            [cell se]
            return cell;
        }
            break;
            
        default:
            return  [self _actsCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
            break;
    }
    
//    WCGoodsActivityProgram1Cell *cell = [tableView dequeueReusableCellWithIdentifier:__program1CellIdentifier forIndexPath:indexPath];
    
    
    return nil;
}

- (UITableViewCell *)_actsCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indesPath {
    
    WCGoodsActs *acts = [_mViewModel elementForIndexPath:indesPath];
    WCBaseActivityProgramCell *cell = nil;
    switch (acts.templateType) {
        case WCHomeCellTypeOneImageView: {
            cell = [tableView dequeueReusableCellWithIdentifier:__program1CellIdentifier];
            [WCGoodsActivityProgram1Cell renderCell:cell tableView:tableView indexPath:indesPath element:acts];
        }
            break;
        case WCHomeCellTypeTwoImageView: {
            cell = [tableView dequeueReusableCellWithIdentifier:__program2CellIdentifier];
            [WCGoodsActivityProgram2Cell renderCell:cell tableView:tableView indexPath:indesPath element:acts];
        }
            break;
        case  WCHomeCellTypeThreeImageView: {
            cell = [tableView dequeueReusableCellWithIdentifier:__program3CellIdentifier];
            [WCGoodsActivityProgram3Cell renderCell:cell tableView:tableView indexPath:indesPath element:acts];
        }
            break;
        default:
            break;
    }
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case WCHomeCellTypeBombGoods:{
            return [WCGoodsCell cellHeightWithCell:nil tableView:tableView indexPath:indexPath element:nil];
        }
            break;
        default:
            return [self _actsCellWithTableView:tableView heightForRowIndexPath:indexPath];
            break;
    }
    return 44;
}

- (CGFloat)_actsCellWithTableView:(UITableView *)tableView heightForRowIndexPath:(NSIndexPath *)indexPath {
    WCGoodsActs *acts = [_mViewModel elementForIndexPath:indexPath];
    switch (acts.templateType) {
        case 1:
            return [WCGoodsActivityProgram1Cell cellHeightWithCell:nil tableView:tableView indexPath:indexPath element:nil];
            break;
        case 2:
            return [WCGoodsActivityProgram2Cell cellHeightWithCell:nil tableView:tableView indexPath:indexPath element:nil];
            break;
        case 3:
            return [WCGoodsActivityProgram3Cell cellHeightWithCell:nil tableView:tableView indexPath:indexPath element:nil];
            break;
        default:
            return 44;
            break;
    }
    
    return 44;
}

#pragma mark - Action

- (IBAction)pressedHomeButtonForClick:(id)sender {
    DLog(@"%@",sender);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)test:(id)sender {
    NSLog(@"test");
}

@end
