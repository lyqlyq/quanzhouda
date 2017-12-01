//
//  LYQUserLocationTool.h
//  quanzhouda
//
//  Created by pro on 2017/11/30.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LYQUserLocationModel;
@interface LYQUserLocationTool : NSObject

// 定位用户位置
+ (void)startUserLocationSuccess:(void(^)(LYQUserLocationModel *model))success failure:(void(^)(NSError *error))failure;

@end
