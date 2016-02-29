//
//  WCThread.h
//  wochudemo
//
//  Created by wochu on 16/2/22.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCObject.h"

@interface WCThread : WCObject

void go(dispatch_block_t);
void run(dispatch_block_t);

@end
