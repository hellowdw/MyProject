//
//  Macros.h
//  wochudemo
//
//  Created by wochu on 16/2/16.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

//定义输出方式
#ifdef DEBUG
#  define DLog(fmt, ...)   NSLog((@"%s [Line %d] " fmt),__PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__);
#else
#  define DLog(...)
#endif

#define ELog(fmt, ...)       NSLog((@"WCError -> %s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#ifdef DEBUG
#  define WCAssert assert
#else
#  define WCAsset
#endif


#define WCButtonTopMargin 5
#define WCButtonImageScale 0.8

#define WCScreenWidth [UIScreen mainScreen].bounds.size.width
#define WCScreenHeight [UIScreen mainScreen].bounds.size.height 

#define WCHomeAdPageColor      [UIColor colorWithRed:200/255.0f green:200/255.0f blue:200/255.0f alpha:1.0f]
#define WCHomeAdCurrentPageColor      [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f]







#endif /* Macros_h */
