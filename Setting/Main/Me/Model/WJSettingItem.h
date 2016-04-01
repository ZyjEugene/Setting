//
//  WJSettingItem.h
//  Setting
//
//  Created by wj on 16/3/28.
//  Copyright © 2016年 com.wj. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,WJItemAccessoryType){
    WJItemAccessoryTypeNone = 0,            // don't show any accessory view
    WJItemAccessoryTypeDisclosureIndicator, // the some with system DisclosureIndicator
    WJItemAccessoryTypeSwitch,              // switch
};

typedef void (^ExecuteCode)();

@interface WJSettingItem : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *detailTitle;
@property (nonatomic,strong) UIImage *image;
@property (nonatomic,strong) UIImage *detailImage;


@property (nonatomic,assign) WJItemAccessoryType accessoryType;

@property (nonatomic,copy)   ExecuteCode executeCode; /** 点击item要执行的代码*/

@property (nonatomic,assign) BOOL defaultOn;/** switch的默认开关状态 */

@property (nonatomic,copy)   void (^switchValueChanged)(BOOL isOn);/**监测WJItemAccessoryTypeSwitch下开关状态变化 */

+ (BOOL)isOnSwitchByTitle:(NSString *)title;/**  根据SwitchItem 设置的title 获取UISwitch的开关状态  **/

#pragma mark - class
@property (nonatomic,assign) Class jumpClass;

+ (WJSettingItem *)initWithItemJumpControllerClass:(Class)jumpControllerClass;

@end
