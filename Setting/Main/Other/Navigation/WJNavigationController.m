//
//  WJNavigationController.m
//  Setting
//
//  Created by wj on 16/3/3.
//  Copyright © 2016年 com.wj. All rights reserved.
// 自定义iOS7导航栏背景,标题和返回按钮文字颜色
// http://blog.csdn.net/mad1989/article/details/41516743

#import "WJNavigationController.h"

@interface WJNavigationController ()

@end

@implementation WJNavigationController

+ (void)initialize
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
     //方法1 黑底白字
//    UINavigationBar *bar = [UINavigationBar appearance];
//    bar.barTintColor = DEFAULT_NAVBAR_COLOR;
//    bar.titleTextAttributes = @{NSFontAttributeName:SysFontWithSize(16)};
    
    //方法2
    //self.navigationBar.barTintColor = DEFAULT_NAVBAR_COLOR;//设置NavigationBar背景颜色
    //self.navigationBar.tintColor=[UIColor whiteColor];
    //[[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
     
    //蓝底黑字
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_bg"]forBarMetrics:UIBarMetricsDefault];
    // Do any additional setup after loading the view.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
