//
//  WJSettingItem.m
//  Setting
//
//  Created by wj on 16/3/28.
//  Copyright © 2016年 com.wj. All rights reserved.
//

#import "WJSettingItem.h"
#import "LocalStorageTool.h"

@implementation WJSettingItem

+ (WJSettingItem *)initWithItemJumpControllerClass:(Class)jumpControllerClass {
    
    WJSettingItem *item = [[self alloc] init];
    item.jumpClass = jumpControllerClass;
    return item;
}

+ (BOOL)isOnSwitchByTitle:(NSString *)title {
    
    return [LocalStorageTool isTurnOnSwitchByTitle:title];
}


@end
