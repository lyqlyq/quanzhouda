//
//  LYQUploadImageTool.m
//  quanzhouda
//
//  Created by pro on 2017/11/24.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQUploadImageTool.h"
#import <QNUploadOption.h>
#import <QiniuSDK.h>

@implementation LYQUploadImageTool

//给图片命名

+ (NSString *)getDateTimeString {
    
    NSDateFormatter *formatter;
    NSString        *dateString;
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    dateString = [formatter stringFromDate:[NSDate date]];
    
    return dateString;
}


+ (NSString *)randomStringWithLength:(int)len {
    
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i = 0; i<len; i++) {
        
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((int)[letters length])]];
    }
    
    return randomString;
}

+(void)uploadImage:(UIImage *)image success:(void (^)(NSString *))success failure:(void (^)())failure{
    
    [self getQiniuUploadToken:^(NSString *token) {
       NSData *data = UIImageJPEGRepresentation(image, 0.01);
        if (!data) {
            
            if (failure) {
                
                failure();
            }
            return;
        }
        
        NSString *fileName = [NSString stringWithFormat:@"%@_%@.png", [LYQUploadImageTool getDateTimeString], [LYQUploadImageTool randomStringWithLength:8]];
        
        QNUploadOption *opt = [[QNUploadOption alloc] initWithMime:nil
                                                   progressHandler:nil
                                                            params:nil
                                                          checkCrc:NO
                                                cancellationSignal:nil];
        QNUploadManager *uploadManager = [QNUploadManager sharedInstanceWithConfiguration:nil];
        
        [uploadManager putData:data
                           key:fileName
                         token:token
                      complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                          if (info.statusCode == 200 && resp) {
                              NSString *url= resp[@"key"];
                              if (success) {
                                  success(url);
                              }
                          }
                          else {
                              if (failure) {
                                  
                                  failure();
                              }
                          }
                          
                      } option:opt];
        
        
    } failure:^{
        failure();
    }];
    
    
}
+ (void)getQiniuUploadToken:(void (^)(NSString *))success failure:(void (^)())failure {
    
    
    NSString *getTokenURL = @"http://192.168.1.8/ThinkPHP5.0/public/index.php/user/upload/token";

    
    [LYQRequestTool GETURL:getTokenURL params:nil success:^(id responseObject) {
         success(responseObject[@"token"]);
    } failure:^(NSError *error) {
        if (error) {
                        failure();
                    }
    } showMessage:nil successMessage:nil failureMessage:nil isShowMessage:NO];
    
//    [LYQNetWorkTool POSTURL:getUploadImageToken params:nil success:^(id data) {
//        success(data[@"token"]);
//    } failure:^(NSError *error) {
//        if (error) {
//            failure();
//        }
//    }];
  
}



@end
