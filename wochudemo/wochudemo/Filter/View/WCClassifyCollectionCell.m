//
//  WCClassifyCollectionCell.m
//  wochudemo
//
//  Created by wochu on 16/5/17.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCClassifyCollectionCell.h"
#import "WCClassifyModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define WCCellMargin 10

@interface WCClassifyCollectionCell ()
@property (weak, nonatomic) IBOutlet UIImageView *mImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation WCClassifyCollectionCell

- (instancetype)renderCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath element:(id)element {
    WCClassifyModel *classifyModel = (WCClassifyModel *)element;
    self.titleLabel.text = classifyModel.name ? : @"";
    [self.mImageView sd_setImageWithURL:[NSURL URLWithString:classifyModel.checkicon] placeholderImage:[WCAPPGlobal placeholderImage]];
    return nil;
}

+ (CGSize)cellSizeWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath element:(id)element {
    CGFloat width = ((WCScreenWidth*0.75)-(3*WCCellMargin))*0.5;
    return CGSizeMake(width,width + 40);
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
