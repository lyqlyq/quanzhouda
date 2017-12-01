//
//  LYQPushPlaceRequest.h
//  quanzhouda
//
//  Created by pro on 2017/11/30.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>


@class LYQPushPlaceParam;
@class LYQPushPlaceModel;
@interface LYQPushPlaceRequest : NSObject

/**发送行程*/
+(void)POSTPushPlaceParam:(LYQPushPlaceParam *)pushParam success:(void(^)(LYQPushPlaceModel *model))success failure:(void(^)(NSError *error))failure;

@end
