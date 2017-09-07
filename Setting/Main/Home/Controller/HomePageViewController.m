//
//  HomePageViewController.m
//  Setting
//
//  Created by wj on 16/3/23.
//  Copyright © 2016年 com.wj. All rights reserved.
//

#import "HomePageViewController.h"
#import "UIViewController+NavBarHidden.h"

#import "ViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // 导航条设置
    self.automaticallyAdjustsScrollViewInsets = NO;

    //清除默认导航条的背景颜色
    [self clearNavBar];
    
    [self setUpNavBar];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self scrollControl];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [self scrollControl];
}

- (void)scrollControl {
    
    //rate将决定颜色变化程度,值越大,颜色变化越明显,rate的取值范围是0.01 - 0.999999
    [self scrollControlRate:0.5 colorWithRed:0.0 green:1.0 blue:0.0 ];
}

- (void)setUpNavBar {
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"首页";
    [titleLabel sizeToFit];
    titleLabel.textColor = [UIColor blackColor];
    self.navigationItem.titleView = titleLabel;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"点击首页返回屏幕顶部－－%ld",indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ViewController *view = [[ViewController alloc] init];
    view.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:view animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 
@end
