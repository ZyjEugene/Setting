                //
//  WJTabBarController.m
//  Setting
//
//  Created by wj on 16/3/3.
//  Copyright © 2016年 com.wj. All rights reserved.
//

#import "WJTabBarController.h"
#import "WJNavigationController.h"

#import "HomePageViewController.h"
#import "MineViewController.h"

@interface WJTabBarController ()<UITabBarControllerDelegate>
{
    NSInteger _lastSelectedIndex;
}

@property (readonly, nonatomic) NSInteger lastSelectedIndex;

@end

@implementation WJTabBarController
@synthesize lastSelectedIndex=_lastSelectedIndex;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tabBar.barTintColor = DEFAULT_TABBAR_BACKGOUND_COLOR;
    self.tabBar.tintColor = DEFAULT_TABBAR_TITLE_COLOR;
    self.tabBar.translucent = YES;//透明作用的属性
    
    [self addChildViewContollers];
    // Do any additional setup after loading the view.
}

/**
 *  添加所有的子控制器
 */
- (void)addChildViewContollers {
   
    HomePageViewController *firstView = [[HomePageViewController alloc] init];
    [self setUpChildViewController:firstView
                             title:@"首页"
                         imageName:@"tabbar_chat_no"
                 selectedImageName:@"tabbar_chat_yes"];
    
    MineViewController *mineView = [[MineViewController alloc] init];
    [self setUpChildViewController:mineView
                             title:@"我"
                         imageName:@"tabbar_me_no"
                 selectedImageName:@"tabbar_me_yes"];
    
}
/**
 *  添加子控制器
 *
 *  @param viewController    子控制器
 *  @param title             标题
 *  @param imageName         图片
 *  @param seletedImageName  选中后的图片
 */
- (void)setUpChildViewController:(UIViewController *)viewController
                           title:(NSString *)title
                       imageName:(NSString *)imageName
               selectedImageName:(NSString *)seletedImageName {
   
    viewController.title = title;
     
    viewController.tabBarItem.image = [UIImage imageWithNamed:imageName];//iOS7中的一个设置UIImage的渲染模式
    
    viewController.tabBarItem.selectedImage = [UIImage imageWithNamed:seletedImageName];

    WJNavigationController *nav = [[WJNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:nav];
    
}

/**
 *  重写父类的setSelectedIndex方法,在父类调用之前获取最后一次选中的位置
 *
 *  @param selectedIndex 当前选中的位置
 */
-(void)setSelectedIndex:(NSUInteger)selectedIndex {
       //判断是否相等,不同才设置
    if (self.lastSelectedIndex != self.selectedIndex) {
        //设置最近一次
        _lastSelectedIndex = self.selectedIndex;
        NSLog(@"%ld,-%ld",self.lastSelectedIndex,selectedIndex) ;
     }
 
    //调用父类的setSelectedIndex
    [super setSelectedIndex:selectedIndex];
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
      //获得选中的item
    NSUInteger tabIndex = [tabBar.items indexOfObject:item];
    if (tabIndex != self.selectedIndex) {
        //设置最近一次变更
        _lastSelectedIndex = self.selectedIndex;
        NSLog(@"OLD:%ld , NEW:%ld",self.lastSelectedIndex,tabIndex);
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 1.
  //为tabBar插入背景图片
 UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.tabBar.bounds.size.height)];
 view.backgroundColor = [UIColor redColor];
 [self.tabBar insertSubview:view atIndex:0];
 
 2.

*/

@end
