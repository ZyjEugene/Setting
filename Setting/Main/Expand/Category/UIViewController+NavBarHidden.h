//
//  UIViewController+NavBarHidden.h
//  Setting
//
//  Created by wj on 16/3/23.
//  Copyright © 2016年 com.wj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavBarHidden)

/** 需要监听的view  告诉程序是根据哪个scrollView的滚动来控制状态栏的变化*/
@property (nonatomic,weak) UIScrollView * keyScrollView;

/** 设置导航条上的标签是否需要跟着隐藏  */
- (void)navBarItemAlpha:(BOOL)isNavBarItemAlpha;

/** 清除默认导航条的背景设置 */
- (void)clearNavBar;

/** rate将决定颜色变化程度,值越大,颜色变化越明显,rate的取值范围是0.01 - 0.999999 */
- (void)scrollControlRate:(CGFloat)height colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue ;


@end
