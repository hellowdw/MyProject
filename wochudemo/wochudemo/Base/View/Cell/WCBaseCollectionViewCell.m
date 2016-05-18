//
//  WCBaseCollectionViewCell.m
//  wochudemo
//
//  Created by wochu on 16/5/17.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseCollectionViewCell.h"

@implementation WCBaseCollectionViewCell

- (instancetype)renderCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath element:(id)element {
    WCAssert(0 && @"子类必须重写");
    return nil;
}

+ (CGSize)cellSizeWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath element:(id)element {
    WCAssert(0 && @"子类必须重写");
    return CGSizeMake(100, 100);
}

- (void)dealloc {
    DLog(@"%@",NSStringFromClass([self class]));
}

@end
