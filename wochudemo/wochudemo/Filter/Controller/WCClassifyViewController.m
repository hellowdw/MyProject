//
//  WCClassifyViewController.m
//  wochudemo
//
//  Created by wochu on 16/5/16.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCClassifyViewController.h"
#import "WCClassifyCollectionCell.h"
#import "WCClassifyTableViewCell.h"
#import "WCClassifyViewModel.h"


static NSString *__tableViewCellIdentifier = @"WCClassifyTableViewCell";
static NSString *__collectionCellIdentifier = @"WCClassifyCollectionCell";

@interface WCClassifyViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet WCClassifyViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSIndexPath *selectedIndexPath;

@end

@implementation WCClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setup];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self _refresh];
    });
}

#pragma mark - setup

- (void)_setup {
    
}

- (void)_refresh {
    [RSProgressHUD show];
    __weak typeof(self) weakSelf = self;
    [_viewModel refresh:^(NSError *error) {
        [RSProgressHUD dismiss];
        if (error) {
            [RSProgressHUD showErrorWithStatus:[error errorDescription]];
        } else {
            [weakSelf.tableView reloadData];
            [weakSelf.collectionView reloadData];
            [weakSelf setSelectedIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        }
    }];
}

#pragma mark - tableViewDelegate 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_viewModel numberOfRowsInSction:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WCClassifyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:__tableViewCellIdentifier forIndexPath:indexPath];
    [WCClassifyTableViewCell renderCell:cell tableView:tableView indexPath:indexPath element:[_viewModel elementForIndexPathInTableView:indexPath]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}



#pragma mark - collectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_viewModel numberOfItemsInSction:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WCClassifyCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:__collectionCellIdentifier forIndexPath:indexPath];
    [cell renderCellWithCollectionView:collectionView indexPath:indexPath element:[_viewModel elementForIndexPathInCollectonView:indexPath]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [WCClassifyCollectionCell cellSizeWithCollectionView:collectionView indexPath:indexPath element:nil];
}


- (void)setSelectedIndexPath:(NSIndexPath *)selectedIndexPath {
    _selectedIndexPath = selectedIndexPath;
    [_tableView selectRowAtIndexPath:selectedIndexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
