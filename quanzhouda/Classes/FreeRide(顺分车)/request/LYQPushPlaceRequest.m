//
//  LYQPushPlaceRequest.m
//  quanzhouda
//
//  Created by pro on 2017/11/30.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQPushPlaceRequest.h"

#import "LYQPushPlaceParam.h"



#define pushPlaceURL @"http://192.168.1.8/ThinkPHP5.0/public/index.php/user/Place/place"

@implementation LYQPushPlaceRequest
+(void)POSTPushPlaceParam:(LYQPushPlaceParam *)pushParam success:(void (^)(LYQPushPlaceModel *))success failure:(void (^)(NSError *))failure{
    
    [LYQRequestTool POSTURL:pushPlaceURL params:pushParam.mj_keyValues success:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    } showMessage:@"行程发布中" successMessage:@"行程发送成功" failureMessage:@"行程发布失败" isShowMessage:YES];

}
@end
