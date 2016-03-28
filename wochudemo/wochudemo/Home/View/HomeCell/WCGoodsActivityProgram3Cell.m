//
//  WCGoodsActivityProgram3Cell.m
//  wochudemo
//
//  Created by wochu on 16/3/22.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCGoodsActivityProgram3Cell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "WCGoodsActs.h"
#import "WCGoodsAction.h"
#import "WCAPPGlobal.h"

@interface WCGoodsActivityProgram3Cell ()
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rightTopImageView;

@property (weak, nonatomic) IBOutlet UIImageView *rightBottomImageView;


@end

@implementation WCGoodsActivityProgram3Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    NSArray *tempArray = @[_leftImageView,_rightBottomImageView,_rightTopImageView];
    for (NSInteger idx = 0; idx< tempArray.count; idx ++) {
        UIImageView *imageView = tempArray[idx];
        imageView.tag = idx;
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_pressedActivityImageView:)]];
    }
    
}

+ (instancetype)renderCell:(WCGoodsActivityProgram3Cell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element {
    cell.element = element;
    WCGoodsActs *acts = (WCGoodsActs *)element;
    if (acts.items.count < 3) {
        WCAssert (0 && "少数据");
    } else {
        [cell.leftImageView sd_setImageWithURL:[NSURL URLWithString:[acts.items[0] imgUrl]] placeholderImage:[WCAPPGlobal placeholderImage]];
        [cell.rightTopImageView sd_setImageWithURL:[NSURL URLWithString:[acts.items[1] imgUrl]] placeholderImage:[WCAPPGlobal placeholderImage]];
        [cell.rightBottomImageView sd_setImageWithURL:[NSURL URLWithString:[acts.items[2] imgUrl]] placeholderImage:[WCAPPGlobal placeholderImage]];
    }
    return cell;
    
}

+ (CGFloat)cellHeightWithCell:(WCBaseTableViewCell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element {
    return WCScreenWidth/1.559;
}

- (void)_pressedActivityImageView:(UITapGestureRecognizer *)tap {
    
}


@end
