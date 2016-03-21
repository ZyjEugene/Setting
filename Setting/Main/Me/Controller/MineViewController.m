//
//  MineViewController.m
//  Setting
//
//  Created by wj on 16/3/3.
//  Copyright © 2016年 com.wj. All rights reserved.
//

#import "MineViewController.h"
#import "WJUserDetailCell.h"
#import "WJPeopleModel.h"

@interface MineViewController ()

@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) NSArray *imageArray;

@property (strong, nonatomic) WJPeopleModel *peopleModel;

@end

@implementation MineViewController

- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[WJUserDetailCell class] forCellReuseIdentifier:@"userDetailCell"];
   
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self prepareData];
}

- (void)prepareData {
    self.dataArray = @[@[@""],
                      @[@"相册",@"收藏",@"钱包"],
                      @[@"表情"],
                      @[@"设置"]
                      ];
    self.imageArray = @[@[@""],
                        @[@"me_photo",@"me_collect",@"me_money"],
                        @[@"me_smail"],
                        @[@"me_setting"]
                        ];
    self.peopleModel = [[WJPeopleModel alloc] init];
    self.peopleModel.username = @"张艳金";
    self.peopleModel.nikename = @"Eugene_iOS";
    self.peopleModel.avatar = @"me_photo";
    
    if (self.tableView) {
        [self.tableView reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
     return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sectionAry = self.dataArray[section];
    return sectionAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        WJUserDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userDetailCell"];
        if (cell == nil) {
            cell = [[WJUserDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userDetailCell"];
        }
        
        return cell;
    } else {
        
        static NSString *identifier = @"cellIdentifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
    
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        WJUserDetailCell *peopleCell = (WJUserDetailCell *)cell;
        [peopleCell setPeopleModel:self.peopleModel];
    } else {
        cell.imageView.image = [UIImage imageNamed:self.imageArray[indexPath.section][indexPath.row]];
        cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return RATIO_HEIGHT(86);
    }
    return RATIO_HEIGHT(43);
}






@end
