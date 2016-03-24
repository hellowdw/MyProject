//
//  WCGoodsActivityProgram2Cell.m
//  wochudemo
//
//  Created by wochu on 16/3/22.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCGoodsActivityProgram2Cell.h"
#import "WCGoodsAction.h"
#import "WCGoodsActs.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface WCGoodsActivityProgram2Cell()

@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;

@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;

@end


@implementation WCGoodsActivityProgram2Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [_rightImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_pressedActivityImageView:)]];
    
    [_leftImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_pressedActivityImageView:)]];
}

+ (instancetype)renderCell:(WCGoodsActivityProgram2Cell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element {
    cell.element = element;
    WCGoodsActs *acts = (WCGoodsActs *)element;
    if (acts.items.count < 2) {
        WCAssert(0 && @"数据太少");
    } else {
        WCGoodsAction *action1 = acts.items[0];
        [cell.rightImageView sd_setImageWithURL:[NSURL URLWithString:action1.imgUrl] placeholderImage:[WCAPPGlobal placeholderImage]];
        
        WCGoodsAction *action2 = acts.items[1];
        [cell.leftImageView sd_setImageWithURL:[NSURL URLWithString:action2.imgUrl] placeholderImage:[WCAPPGlobal placeholderImage]];
    }
    
    
    return cell;
}

+ (CGFloat)cellHeightWithCell:(WCBaseTableViewCell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element {
    return WCScreenWidth/2.734;
}

- (void)_pressedActivityImageView:(UITapGestureRecognizer *)tap {
    
}

@end
