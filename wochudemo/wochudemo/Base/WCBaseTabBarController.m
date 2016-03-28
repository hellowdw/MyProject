//
//  WCBaseTabBarController.m
//  wochudemo
//
//  Created by wochu on 16/3/24.
//  Copyright © 2016年 wochu_wdw. All rights reserved.
//

#import "WCBaseTabBarController.h"
#import "WCViewControllerManager.h"
#import "WCBaseNavigationViewController.h"
#import "WCAPPGlobal.h"

@interface WCBaseTabBarController ()

@end

@implementation WCBaseTabBarController

- (void)loadView {
    [super loadView];
    self.viewControllers = [WCViewControllerManager viewControllers];
    
    NSArray *imageNames = @[@"tabBar_button_home_nselected", @"tabBar_button_classification_nselected"];
    
    NSArray *selectedImageNames = @[@"tabBar_button_home_default", @"tabBar_button_classific_default"];
    
//    NSArray *imageNames = @[@"tabBar_button_home_nselected", @"tabBar_button_classification_nselected", @"tabBar_button_shopping_nselected", @"tabBar_button_center_nselected"];
//    NSArray *selectedImageNames = @[@"tabBar_button_home_default", @"tabBar_button_classific_default",  @"tabBar_button_shopping_default", @"tabBar_button_center_default"];
    
    NSArray *titles = @[@"首页",@"分类"];
    for (NSInteger idx = 0; idx <self.viewControllers.count; idx ++) {
        WCBaseNavigationViewController *navVC = self.viewControllers[idx];
        UIViewController *VC = navVC.viewControllers[0];
        [self setupChildController:VC image:imageNames[idx] selectedImage:selectedImageNames[idx] title:titles[idx] forIndex:idx];
    }
    
    [self.tabBar setTintColor:[WCAPPGlobal greenColor]];
    //[self.tabBar setsel]
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedIndex = 0;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action

- (void)setupChildController:(UIViewController *)controller image:(NSString *)imageName selectedImage:(NSString *)selectedImageName title:(NSString *)title forIndex:(NSInteger)idx {
    controller.title = title;
    controller.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:[UIImage imageNamed:imageName] selectedImage:[UIImage imageNamed:selectedImageName]];
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
