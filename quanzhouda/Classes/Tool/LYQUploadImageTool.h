//
//  LYQUploadImageTool.h
//  quanzhouda
//
//  Created by pro on 2017/11/24.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYQUploadImageTool : NSObject


+ (void)uploadImage:(UIImage *)image  success:(void (^)(NSString *url))success failure:(void (^)())failure;

@end
