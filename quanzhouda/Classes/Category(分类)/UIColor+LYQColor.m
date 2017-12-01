//
//  UIColor+LYQColor.m
//  quanzhouda
//
//  Created by pro on 2017/11/16.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "UIColor+LYQColor.h"

@implementation UIColor (LYQColor)


+(UIColor *)blackColorWithAlpha:(CGFloat )alpha{
    
    return  [UIColor colorWithRed:0 green:0 blue:0 alpha:alpha];
    
}

+(UIColor *)blackColorWithDetfaleAlpha{
    return  [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
}

+(UIColor *)colorWithR:(CGFloat) r g:(CGFloat )g b:(CGFloat )b{
    
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}
+ (UIColor *)colorWithHexString:(NSString *)color{
    
    return [self colorWithHexString:color alpha:1.0f];
}
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha{
    
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
    
}

@end
