//
//  LYQLoginAndRegisterRequest.m
//  quanzhouda
//
//  Created by pro on 2017/11/30.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQLoginAndRegisterRequest.h"


#define loginURL @"http://192.168.1.8/ThinkPHP5.0/public/index.php/user/user/login"
#define registerURL @"http://192.168.1.8/ThinkPHP5.0/public/index.php/user/user/register"
#define codeURL @"http://192.168.1.8/ThinkPHP5.0/public/index.php/user/user/delivery"
@implementation LYQLoginAndRegisterRequest

/**登录*/
+(void)POSTLoginParam:(LYQLoginAndRegistBaseParam *)loginParam success:(void(^)(LYQLoginModel *model))success failure:(void(^)(NSError *error))failure{
    
    [LYQRequestTool POSTURL:loginURL params:loginParam.mj_keyValues success:^(id responseObject) {
        LYQLoginModel * model = [LYQLoginModel mj_objectWithKeyValues:responseObject];
        if (success) {
            
            success(model);
          }
    } failure:^(NSError *error) {
        if (error) {
                        failure(error);
                    }
    } showMessage:@"登录中..." successMessage:nil failureMessage:nil isShowMessage:YES];
    
}

/**注册*/
+(void)POSTRegisterParam:(LYQLoginAndRegistBaseParam *)registerParam success:(void(^)(LYQRegisterModel *model))success failure:(void(^)(NSError *error))failure{
    
    
    [LYQRequestTool POSTURL:registerURL params:registerParam.mj_keyValues success:^(id responseObject) {
        LYQRegisterModel * model = [LYQRegisterModel mj_objectWithKeyValues:responseObject];
        if (success) {
            
            success(model);
        }
    } failure:^(NSError *error) {
        if (error) {
            failure(error);
        }
    } showMessage:@"注册中..." successMessage:nil failureMessage:nil isShowMessage:YES];

}

/**验证码*/
+(void)POSTCodeParam:(LYQLoginAndRegistBaseParam *)codeParam success:(void(^)(LYQLoginAndRegistBaseModel *model))success failure:(void(^)(NSError *error))failure{
    [LYQRequestTool POSTURL:codeURL params:codeParam.mj_keyValues success:^(id responseObject) {
        LYQLoginAndRegistBaseModel * model = [LYQLoginAndRegistBaseModel mj_objectWithKeyValues:responseObject];
        if (success) {
            
            success(model);
        }
    } failure:^(NSError *error) {
        if (error) {
            failure(error);
        }
    } showMessage:@"发送中..." successMessage:nil failureMessage:nil isShowMessage:YES];
    
}




@end
