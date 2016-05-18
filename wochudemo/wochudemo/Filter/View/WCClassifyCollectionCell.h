//
//  WCClassifyCollectionCell.h
//  wochudemo
//
//  Created by wochu on 16/5/17.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseCollectionViewCell.h"

@interface WCClassifyCollectionCell : WCBaseCollectionViewCell

- (instancetype)renderCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath element:(id)element;

+ (CGSize)cellSizeWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath element:(id)element;


@end
