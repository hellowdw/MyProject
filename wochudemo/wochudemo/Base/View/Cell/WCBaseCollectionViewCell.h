//
//  WCBaseCollectionViewCell.h
//  wochudemo
//
//  Created by wochu on 16/5/17.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WCBaseCollectionViewCell : UICollectionViewCell

- (instancetype)renderCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath element:(id)element;

+ (CGSize)cellSizeWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath element:(id)element;

@end
