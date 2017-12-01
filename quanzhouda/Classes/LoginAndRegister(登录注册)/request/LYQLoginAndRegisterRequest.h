//
//  LYQLoginAndRegisterRequest.h
//  quanzhouda
//
//  Created by pro on 2017/11/30.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LYQLoginAndRegistBaseParam.h"
#import "LYQLoginAndRegistBaseModel.h"

#import "LYQRegisterModel.h"
#import "LYQLoginModel.h"

@interface LYQLoginAndRegisterRequest : NSObject




/**登录*/
+(void)POSTLoginParam:(LYQLoginAndRegistBaseParam *)loginParam success:(void(^)(LYQLoginModel *model))success failure:(void(^)(NSError *error))failure;

/**注册*/
+(void)POSTRegisterParam:(LYQLoginAndRegistBaseParam *)registerParam success:(void(^)(LYQRegisterModel *model))success failure:(void(^)(NSError *error))failure;

/**验证码*/
+(void)POSTCodeParam:(LYQLoginAndRegistBaseParam *)codeParam success:(void(^)(LYQLoginAndRegistBaseModel *model))success failure:(void(^)(NSError *error))failure;




@end
