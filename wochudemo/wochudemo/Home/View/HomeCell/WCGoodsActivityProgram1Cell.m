//
//  WCGoodsActivityProgram1Cell.m
//  wochudemo
//
//  Created by wochu on 16/2/17.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCGoodsActivityProgram1Cell.h"
#import "WCGoodsActs.h"
#import "WCGoodsAction.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface WCGoodsActivityProgram1Cell()

@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;

@end

@implementation WCGoodsActivityProgram1Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    [_thumbImageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_pressedActivityImageView:)]];
}

+ (instancetype)renderCell:(WCGoodsActivityProgram1Cell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element {
    cell.element = element;
    WCGoodsActs *acts = (WCGoodsActs *)element;
    WCGoodsAction *action = [acts.items firstObject];
    [cell.thumbImageView sd_setImageWithURL:[NSURL URLWithString:action.imgUrl] placeholderImage:[WCAPPGlobal placeholderImage]];
    
    return cell;
}


+ (CGFloat)cellHeightWithCell:(WCBaseTableViewCell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath element:(id)element {
    return WCScreenWidth/3.2;
}


- (void)_pressedActivityImageView:(UITapGestureRecognizer *)tap {
    
}

@end
