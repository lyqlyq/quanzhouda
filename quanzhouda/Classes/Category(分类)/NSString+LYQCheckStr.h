//
//  NSString+LYQCheckStr.h
//  quanzhouda
//
//  Created by pro on 2017/11/20.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LYQCheckStr)
// 判断手机号
+(BOOL)isMobileNumber:(NSString *)mobileNum;
// 判断密码
+ (BOOL)checkPassword:(NSString *) password;
@end
