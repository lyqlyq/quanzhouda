//
//  LYQChoseWindowTool.m
//  quanzhouda
//
//  Created by pro on 2017/11/30.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQChoseWindowTool.h"

#import "LYQUserTool.h"
#import "LYQUser.h"

#import "LYQLoginRegController.h"
#import "LYQTabbarController.h"


@implementation LYQChoseWindowTool


+(void)choseWindowWithWindow:(UIWindow *)window{
    
    LYQUser *user = [LYQUserTool getUser];
    LYQLoginRegController *loginRegVC = [[LYQLoginRegController alloc] init];
    LYQTabbarController *tab = [[LYQTabbarController alloc] init];

    if (user == nil) {
        window.rootViewController = loginRegVC;
    }else{
        window.rootViewController = tab;
    }
    
    
}
@end
