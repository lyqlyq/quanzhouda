//
//  LYQPushPlaceParam.m
//  quanzhouda
//
//  Created by pro on 2017/11/30.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQPushPlaceParam.h"
#import "LYQUser.h"
#import "LYQUserTool.h"

@implementation LYQPushPlaceParam


-(instancetype)init{
    if (self = [super init]) {
        LYQUser *user = [LYQUserTool getUser];
        self.u_id = user.u_id;
        self.dt_style = @"0";
        self.dt_remark = @" ";
    }
    return self;
    
}

@end
