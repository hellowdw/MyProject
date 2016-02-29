//
//  WCThread.m
//  wochudemo
//
//  Created by wochu on 16/2/22.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCThread.h"

@implementation WCThread

void go(dispatch_block_t b) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 2), b);
}

void run(dispatch_block_t b) {
    if ([NSThread isMainThread]) {
        b();
    } else {
        dispatch_async(dispatch_get_main_queue(), b);
    }
}

@end
