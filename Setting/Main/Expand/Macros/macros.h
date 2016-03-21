//
//  macros.h
//  Setting
//
//  Created by wj on 16/3/3.
//  Copyright © 2016年 com.wj. All rights reserved.
//

#ifndef macros_h
#define macros_h

#define APPDELEGETE 	((AppDelegate*)[[UIApplication sharedApplication] delegate])

#pragma mark - Frame
// -------------------------------------------------    尺寸定义开始  -------------------------------//
#define WIDTH_SCREEN        [UIScreen mainScreen].bounds.size.width
#define HEIGHT_SCREEN       [UIScreen mainScreen].bounds.size.height

#define RATIO_WHIDTH(WIDTH)  WIDTH * WIDTH_SCREEN/320.0
#define RATIO_HEIGHT(HEIGHT) HEIGHT * HEIGHT_SCREEN/568.0
//满屏CGRect
#define FullScreenRect CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN)

#define HEIGHT_STATUSBAR	20
#define HEIGHT_TABBAR       49
#define HEIGHT_NAVBAR       44

#pragma mark - Color
// -------------------------------------------------    颜色定义开始  -------------------------------//
//通用视觉规范
#define WJWhiteColor COLOR(255, 255, 255)          //纯白
#define WJBlueColor COLOR(0, 153, 255)             //蓝色
#define WJOrangeColor COLOR(253, 106, 60)          //橙色
#define WJYellowColor COLOR(239, 166, 68)          //黄色
#define WJBlackColor COLOR(68, 68, 68)             //浅黑色
#define WJGrayColor COLOR(102, 102, 102)           //灰色
#define WJlightGrayColor COLOR(153, 153, 153)      //浅灰色
#define WJCoffeeColor COLOR(185,152,99)            //咖啡色
#define WJCommonBgColor  COLOR(248, 248, 248)      //灰白色
#define WJSeparatorLineColor COLOR(232, 232, 232)  //分割线颜色
#define WJTranslucentColor ColorWithAlpha(0,0,0,0.55)  //半透明颜色

#define DEFAULT_NAVBAR_COLOR  [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:0.9]

#define DEFAULT_TABBAR_BACKGOUND_COLOR [UIColor colorWithRed:245.0/255 green:245.0/255  blue:245.0/255 alpha:1.0f]

#define DEFAULT_TABBAR_TITLE_COLOR  [UIColor colorWithRed:31.0/255 green:185.0/255  blue:34.0/255 alpha:1.0f]

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

//清除背景色
#define CLEARCOLOR [UIColor clearColor]

//----------------------图片----------------------------
#pragma mark - image
//读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]
 //定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

// ------------------------    字体定义开始  -------------------------------//
#pragma mark - Font
#define SysFontWithSize(s) [UIFont systemFontOfSize:s]
#define PFNFontWithSize(s) [UIFont fontWithName:@"PingFangSC-Regular" size:s]
#define PFBFontWithSize(s) [UIFont fontWithName:@"PingFangSC-Thin" size:s]
#define HTFontWithSize(s)  [UIFont fontWithName:@"Heiti SC" size:s]

//-------------------打印日志-------------------------
#pragma mark - DEBUG
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

//DEBUG  模式下打印日志,当前行 并弹出一个警告
#ifdef DEBUG
#   define ALog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define ALog(...)
#endif


// -------------------------------------------------    工具定义开始  -------------------------------//
#pragma mark - sharedInstance
//定义构造单例的宏
#define SharedInstanceInterfaceBuilder(ClassName) \
+ (instancetype)sharedInstance;

#define SharedInstanceBuilder(ClassName) \
+ (instancetype)sharedInstance\
{\
static dispatch_once_t onceToken;\
static ClassName* instance;\
dispatch_once(&onceToken, ^{\
instance = [[ClassName alloc] init];\
});\
return instance;\
}

#pragma mark - phoneNumber
//拨打电话
#define makeCall(phoneNumber) [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNumber]]];

//tableView 分割线左边距归零
#define clearTableViewSeparator \
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath\
{\
if ([cell respondsToSelector:@selector(setSeparatorInset:)]){\
[cell setSeparatorInset:UIEdgeInsetsZero];\
}\
if ([cell respondsToSelector:@selector(setLayoutMargins:)]){\
[cell setLayoutMargins:UIEdgeInsetsZero];\
}\
}

#define setTableViewSeparatorZeroMargin(_tableView) \
if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]){\
[_tableView setSeparatorInset:UIEdgeInsetsZero];\
}\
if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]){\
[_tableView setLayoutMargins:UIEdgeInsetsZero];\
}

#endif /* macros_h */
