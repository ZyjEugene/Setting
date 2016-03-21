//
//  WJBaseViewController.m
//  Setting
//
//  Created by wj on 16/3/14.
//  Copyright © 2016年 com.wj. All rights reserved.
//

#import "WJBaseViewController.h"

@interface WJBaseViewController ()

@end

@implementation WJBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
     [super viewWillDisappear:animated];
    
    self.hidesBottomBarWhenPushed = YES;
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
