//
//  LYQRequestTool.m
//  quanzhouda
//
//  Created by pro on 2017/11/30.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQRequestTool.h"

#import <AFNetworking.h>
#import "LYQHUD.h"

@implementation LYQRequestTool

+(void)POSTURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure showMessage:(NSString *)message successMessage:(NSString *)successMessage failureMessage:(NSString *)errorMessage isShowMessage:(BOOL)isShow{
    
    NSLog(@"post请求： (url:-------------------------------------------------- %@)   (参数---------------------- %@)",url,params);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    if (isShow) {
        if (message.length > 0) {
            
            [LYQHUD showMessage:message];
        }else{
            [LYQHUD showMessage:@"加载中..."];
        }
        
    }
    
 
    
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject) {
            success(responseObject);
            NSLog(@"成功结果------------%@",responseObject);
            if (successMessage.length > 0) {
                [LYQHudView showInfo:successMessage];
            }
        }
        [LYQHUD dissmiss];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error) {
            failure(error);
        }
        [LYQHUD dissmiss];
        NSLog(@"失败原因-----------%@",error);
        if (errorMessage.length > 0) {
            [LYQHudView showInfo:errorMessage];
        }

        
    }];
    
    
}

+(void)GETURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure showMessage:(NSString *)message successMessage:(NSString *)successMessage failureMessage:(NSString *)errorMessage isShowMessage:(BOOL)isShow{
    
    
    NSLog(@"post请求： (url:-------------------------------------------------- %@)   (参数---------------------- %@)",url,params);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    if (isShow) {
        if (message.length > 0) {
            
            [LYQHUD showMessage:message];
        }else{
            [LYQHUD showMessage:@"加载中..."];
        }
        
    }

    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject) {
            success(responseObject);
            NSLog(@"成功结果------------%@",responseObject);
            if (successMessage.length > 0) {
                [LYQHudView showInfo:successMessage];
            }
        }
        [LYQHUD dissmiss];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error) {
            failure(error);
        }
        [LYQHUD dissmiss];
        NSLog(@"失败原因-----------%@",error);
        if (errorMessage.length > 0) {
            [LYQHudView showInfo:errorMessage];
        }
        
        
    }];
    
}
@end
