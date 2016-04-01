//
//  WJSettingGroup.h
//  Setting
//
//  Created by wj on 16/3/28.
//  Copyright © 2016年 com.wj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJSettingGroup : NSObject

/** TableView每组的数据(item模型数组) */
@property(nonatomic, strong) NSArray *itemArray;

/** TableView头部高度 */
@property(nonatomic, assign) CGFloat headerHeight;

/** TableView头部文本 */
@property(nonatomic, copy) NSString *headerName;

/**TableView头部背景色*/
@property (nonatomic,strong) UIColor  *headerBgColor;

/** TableView底部高度 */
@property(nonatomic, assign) CGFloat footerHeight;

/** TableView底部文本 */
@property(nonatomic, copy) NSString *footerName;

/** TableView头部视图 */
@property(nonatomic, strong) UIView *headerView;

/** TableView底部视图 */
@property(nonatomic, strong) UIView *footerrView;


@end
