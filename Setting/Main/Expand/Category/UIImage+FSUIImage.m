                                                                        //
//  UIImage+FSUIImage.m
//  FastApp
//
//  Created by tangkunyin on 16/3/10.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
// iOS7 nav http://blog.csdn.net/mad1989/article/details/41516743

#import "UIImage+FSUIImage.h"

@implementation UIImage (FSUIImage)

+ (UIImage *)imageWithNamed:(NSString *)name;
{
   //保持图片原色 iOS新特性： http://www.cocoachina.com/industry/20140117/7715.html
    UIImage *image = [[self imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

+ (UIImage *)imageFromColor:(UIColor *)color {
    
    CGSize  size = CGSizeMake(1.0f, 1.0f);
    //开启图形上下文
    UIGraphicsBeginImageContext(size);
    //获取当前图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    //渲染图形上下文
    CGContextFillRect(ctx, CGRectMake(0, 0, size.width, size.height));
    //从图形上下文中获取图片
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}


@end
