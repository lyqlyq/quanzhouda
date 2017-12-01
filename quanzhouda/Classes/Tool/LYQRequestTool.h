//
//  LYQRequestTool.h
//  quanzhouda
//
//  Created by pro on 2017/11/30.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYQRequestTool : NSObject

+(void)POSTURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure showMessage:(NSString *)message successMessage:(NSString *)successMessage failureMessage:(NSString *)errorMessage isShowMessage:(BOOL)isShow;

+(void)GETURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure showMessage:(NSString *)message successMessage:(NSString *)successMessage failureMessage:(NSString *)errorMessage isShowMessage:(BOOL)isShow;

@end
