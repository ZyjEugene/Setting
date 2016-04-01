//
//  MineViewController.m
//  Setting
//
//  Created by wj on 16/3/3.
//  Copyright © 2016年 com.wj. All rights reserved.
//

#import "MineViewController.h"
#import "ViewController.h"

#import "WJUserDetailCell.h" //用户详情cell
#import "WJPeopleModel.h"
#import "WJSettingCell.h"//基础设置cell
#import "WJSettingItem.h"
#import "WJSettingGroup.h"

@interface MineViewController ()

@property (strong, nonatomic) NSArray *groupArray;

@property (strong, nonatomic) WJPeopleModel *peopleModel;

@end

@implementation MineViewController

#pragma mark - 视图生命周期
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBA(234, 234, 234, 1);
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[WJUserDetailCell class] forCellReuseIdentifier:@"userDetailCell"];
    [self setupSettingSection];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self prepareData];
}

#pragma mark - 初始化方法
- (void)setupSettingSection {
    
    //group one
    WJSettingItem *item1 = [WJSettingItem initWithItemJumpControllerClass:[ViewController class]];
    item1.title = @"item1";
    item1.image = [UIImage imageNamed:@"me_setting"];
    item1.detailImage = [UIImage imageNamed:@"found_shop"];
    item1.accessoryType = WJItemAccessoryTypeDisclosureIndicator;
    item1.executeCode = ^{
        NSLog(@"你点击了cell");
    };
    
    WJSettingItem *item2 = [WJSettingItem initWithItemJumpControllerClass:[ViewController class]];
    item2.image = [UIImage imageNamed:@"found_shop"];
    item2.title = @"item3";
    item2.detailTitle = @"做任务赢大惊";
    item2.accessoryType = WJItemAccessoryTypeDisclosureIndicator;
    
    WJSettingGroup *group1 = [[WJSettingGroup alloc] init];
    group1.headerName = @"GROUP_1";
    group1.headerHeight = 20;
    group1.headerBgColor = [UIColor redColor];
    group1.itemArray = @[item1,item2];
    
    //group two
    WJSettingItem *item3 = [WJSettingItem initWithItemJumpControllerClass:[ViewController class]];
    item3.title = @"item4";
    item3.accessoryType = WJItemAccessoryTypeSwitch;
    item3.defaultOn = YES;
    item3.switchValueChanged = ^(BOOL isOn){
        NSLog(@"UISwitch状态改变>开关状态===%@",isOn?@"open":@"close");
    };
    BOOL isOn = [WJSettingItem isOnSwitchByTitle:item3.title];
    NSLog(@"是否打开了开关 %d",isOn);
    
    WJSettingItem *item4 = [WJSettingItem initWithItemJumpControllerClass:[ViewController class]];
    item4.title = @"item5";
    item4.detailImage = [UIImage imageNamed:@""];
    item4.accessoryType = WJItemAccessoryTypeDisclosureIndicator;
    
    WJSettingGroup *group2 = [[WJSettingGroup alloc] init];
    group2.headerName = @"GROUP_2";
    group2.headerHeight = 20;
    group2.footerName = @"footer name";
    group2.footerHeight = 15;
    group2.headerBgColor = [UIColor redColor];
    group2.itemArray = @[item3,item4];
    
    WJSettingGroup *group0 = [[WJSettingGroup alloc] init];
    group0.itemArray = @[@""];
    _groupArray = @[group0,group1,group2];
}

- (void)prepareData {
    
    self.peopleModel = [[WJPeopleModel alloc] init];
    self.peopleModel.username = @"张艳金";
    self.peopleModel.nikename = @"Eugene_iOS";
    self.peopleModel.avatar = @"me_photo";
    
    if (self.tableView) {
        [self.tableView reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
     return self.groupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    WJSettingGroup *group = self.groupArray[section];
    return group.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        static NSString *cellIdentifier = @"userDetailCell";
        WJUserDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[WJUserDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        return cell;
    } else {
        
        static NSString *identifier = @"cellIdentifier";
        WJSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[WJSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
         return cell;
    }
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(WJSettingCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        WJUserDetailCell *peopleCell = (WJUserDetailCell *)cell;
        [peopleCell setPeopleModel:self.peopleModel];
    } else {
        WJSettingGroup *group = self.groupArray[indexPath.section];
        WJSettingItem *itemM = group.itemArray[indexPath.row];
        cell.item = itemM;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WJSettingGroup *sectionModel = self.groupArray[indexPath.section];
    WJSettingItem *itemModel = sectionModel.itemArray[indexPath.row];
    if (itemModel.executeCode) {
        itemModel.executeCode();
        return;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    if (indexPath.section == 0 && indexPath.row == 0) {
        return RATIO_HEIGHT(86);
    }
    return RATIO_HEIGHT(44);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    WJSettingGroup *group = self.groupArray[section];
    return group.headerHeight;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    WJSettingGroup *group = self.groupArray[section];
    return group.headerName;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    WJSettingGroup *group = self.groupArray[section];
    return group.footerHeight;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    WJSettingGroup *group = self.groupArray[section];
    return group.footerName;
}

//uitableview处理section的不悬浮，禁止section停留的方法，主要是这段代码
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    WJSettingGroup *groupModel = [self.groupArray firstObject];
    CGFloat headerHeight = groupModel.headerHeight;
    
    if (scrollView.contentOffset.y<=headerHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=headerHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-headerHeight, 0, 0, 0);
    }
}


@end
