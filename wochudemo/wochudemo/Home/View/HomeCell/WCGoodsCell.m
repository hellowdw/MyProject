//
//  WCGoodsCell.m
//  wochudemo
//
//  Created by wochu on 16/3/14.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCGoodsCell.h"
#import "WCGoodsView.h"
#import "WCBaseGoods.h"

#define WCGoodsMargin 5
#define WCGoodsHeightMargin 10
#define WCGoodsShowNumber 3
#define WCGoodsTitleLabelHeight 30
#define WCGoodsViewLabelHeight 70

@interface WCGoodsCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@property (weak, nonatomic) IBOutlet UIScrollView *goodsScrollView;

@property (strong, nonatomic) NSMutableArray *goodsViewArray;

@end

@implementation WCGoodsCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _goodsViewArray = [NSMutableArray array];
        //这个时候cell才被加载，cell的子视图还没有加载
        //_titleLabel.text = @"爆款商品";
    }
    return self;
}

- (void)awakeFromNib {
    //这个时候cell的子视图才被加载
    _titleLabel.text = @"爆款商品";
    
}



+ (instancetype)renderCell:(WCGoodsCell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element{
    cell.element = element;
    NSArray *goodsArray = (NSArray *)element;
    
    for (NSInteger idx = 0; idx < goodsArray.count; idx ++) {
        WCBaseGoods *goods = goodsArray[idx];
        WCGoodsView *goodsView = nil;
        if (cell.goodsViewArray.count <= idx) {
            goodsView = [WCGoodsView goodsView];
            [cell.goodsScrollView addSubview:goodsView];
            [cell.goodsViewArray addObject:goodsView];
        } else {
            goodsView = cell.goodsViewArray[idx];
        }
        goodsView.tag = idx;
        goodsView.hidden = NO;
        [goodsView renderWithGoods:goods];
    }
    
    if (cell.goodsViewArray.count > goodsArray.count) {
        for (NSInteger idx = goodsArray.count; idx < cell.goodsViewArray.count; idx ++) {
            WCGoodsView *goodsView = cell.goodsViewArray[idx];
            goodsView.hidden = YES;
        }
    }
    
    
    return cell;
}

+ (CGFloat)cellHeightWithCell:(WCBaseTableViewCell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element {
    return [self goodsViewWith] + WCGoodsTitleLabelHeight + WCGoodsViewLabelHeight + WCGoodsHeightMargin;
}

+ (CGFloat)goodsViewWith {
    return (WCScreenWidth - (WCGoodsShowNumber + 1 + 2)*WCGoodsMargin)/WCGoodsShowNumber;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSArray *goodsArray = (NSArray *)self.element;
    CGFloat W = [[self class] goodsViewWith];
    for (NSInteger idx = 0; idx < goodsArray.count; idx++) {
        WCGoodsView *goodsView = _goodsViewArray[idx];
        CGFloat X = (idx + 1) * WCGoodsMargin + idx * W;
        goodsView.frame = CGRectMake(X, 0, W, W + WCGoodsViewLabelHeight);
    }
    _goodsScrollView.contentSize = CGSizeMake(goodsArray.count * W + (goodsArray.count + 1) * WCGoodsMargin, 0);
}

#pragma mark - 添加事件

@end
