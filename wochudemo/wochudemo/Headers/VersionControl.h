//
//  VersionControl.h
//  wochudemo
//
//  Created by wochu on 16/3/1.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#ifndef VersionControl_h
#define VersionControl_h


#ifdef DEBUG

#define WCBaseConnectorAddress @"http://dev1.ikitchen.cc:9093/"

#else 

#define WCBaseConnectorAddress @"http://api4.wochu.cn/"

#endif



#endif /* VersionControl_h */
