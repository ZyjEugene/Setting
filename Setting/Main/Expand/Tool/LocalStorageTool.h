//
//  LocalStorageTool.h
//  Setting
//
//  Created by wj on 16/3/28.
//  Copyright © 2016年 com.wj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalStorageTool : NSObject

/** 设置 */
+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName;

/** 取出设置结果 */
+ (BOOL)boolForKey:(NSString *)defaultName;

/** 是否打开了 */
+ (BOOL)isTurnOnSwitchByTitle:(NSString *)key;

/** 是否设置过 */
+ (BOOL)isContainsKey:(NSString *)key;

@end
