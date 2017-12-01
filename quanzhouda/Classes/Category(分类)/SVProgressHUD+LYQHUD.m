//
//  SVProgressHUD+LYQHUD.m
//  quanzhouda
//
//  Created by pro on 2017/11/20.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "SVProgressHUD+LYQHUD.h"

@implementation SVProgressHUD (LYQHUD)
+(void)show:(NSString *)info delay:(CGFloat )delay{
    [SVProgressHUD showInfoWithStatus:info];
    [SVProgressHUD dismissWithDelay:delay];
}
+(void)showinfo:(NSString *)info{
    [SVProgressHUD showInfoWithStatus:info];
    SVProgressHUD.defaultStyle = SVProgressHUDStyleLight;
    [SVProgressHUD dismissWithDelay:1];
}
@end
