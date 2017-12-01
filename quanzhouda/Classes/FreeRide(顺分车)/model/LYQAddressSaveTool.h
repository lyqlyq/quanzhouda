//
//  LYQAddressSaveTool.h
//  quanzhouda
//
//  Created by pro on 2017/11/29.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LYQAddressModel;
@interface LYQAddressSaveTool : NSObject

+(void)saveAddress:(LYQAddressModel *)model;

+(NSMutableArray *)getAddressModels;

+(void)clearModels;

@end
