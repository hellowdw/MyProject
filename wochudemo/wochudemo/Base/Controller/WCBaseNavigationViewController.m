//
//  WCBaseNavigationViewController.m
//  wochudemo
//
//  Created by wochu on 16/2/15.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseNavigationViewController.h"

@interface WCBaseNavigationViewController ()

@end

@implementation WCBaseNavigationViewController

+ (void)load {
    [super load];
    [self _setup];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

+ (void)_setup {
    UINavigationBar *nav = [UINavigationBar appearance];
    nav.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
