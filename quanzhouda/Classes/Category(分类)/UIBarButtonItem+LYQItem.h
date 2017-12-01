//
//  UIBarButtonItem+LYQItem.h
//  quanzhouda
//
//  Created by pro on 2017/11/16.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LYQItem)
// 快速创建UIBarButtonItem
+ (UIBarButtonItem *)itemWithimage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)backItemWithimage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action title:(NSString *)title;

+ (UIBarButtonItem *)itemWithimage:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action;

// 简单的Item
+(UIBarButtonItem *)creatLeftItemTarget:(id)target action:(SEL)action;

@end
