//
//  LocalStorageTool.m
//  Setting
//
//  Created by wj on 16/3/28.
//  Copyright © 2016年 com.wj. All rights reserved.
//

#import "LocalStorageTool.h"

@implementation LocalStorageTool

+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName {
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)boolForKey:(NSString *)defaultName {
    return [[NSUserDefaults standardUserDefaults] boolForKey:defaultName];
}

/** 是否打开了 */
+ (BOOL)isTurnOnSwitchByTitle:(NSString *)key {
    BOOL status = NO;
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defs dictionaryRepresentation];
    if ([dic.allKeys containsObject:key]) {
        status = [defs boolForKey:key];
    } else {
        status = NO;
    }
    return status;
}

/** 是否设置过 */
+ (BOOL)isContainsKey:(NSString *)key  {
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defs dictionaryRepresentation];
    if ([dic.allKeys containsObject:key]) {
        return YES;
    } else {
        return NO;
    }
    
}

@end
