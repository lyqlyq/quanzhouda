//
//  LYQUserTool.h
//  quanzhouda
//
//  Created by pro on 2017/11/20.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYQUser.h"


@interface LYQUserTool : NSObject
+(void)save:(LYQUser *)user;
+(void)remove;
+(LYQUser *)getUser;
@end
