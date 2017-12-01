//
//  UIColor+LYQColor.h
//  quanzhouda
//
//  Created by pro on 2017/11/16.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LYQColor)

//黑色带透明度
+(UIColor *)blackColorWithAlpha:(CGFloat )alpha;
+(UIColor *)blackColorWithDetfaleAlpha;
+(UIColor *)colorWithR:(CGFloat) r g:(CGFloat )g b:(CGFloat )b;
+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
