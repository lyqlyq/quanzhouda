
//
//  LYQUserTool.m
//  quanzhouda
//
//  Created by pro on 2017/11/20.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQUserTool.h"

#define fileName [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"user.data"]

static LYQUser *_user;

@implementation LYQUserTool


+(void)save:(LYQUser *)user{
    
    [NSKeyedArchiver archiveRootObject:user toFile:fileName];
    
}
+(void)remove{
    
    [NSKeyedArchiver archiveRootObject:nil toFile:fileName];
}
+(LYQUser *)getUser{
    if (_user == nil) {
        _user = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
    }
    
    return _user;
    
}
@end
