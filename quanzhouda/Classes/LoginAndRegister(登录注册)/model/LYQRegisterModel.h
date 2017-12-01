//
//  LYQRegisterModel.h
//  quanzhouda
//
//  Created by pro on 2017/11/30.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQLoginAndRegistBaseModel.h"
#import "LYQUser.h"

@interface LYQRegisterModel : LYQLoginAndRegistBaseModel

@property (nonatomic ,copy) NSString *code;
@property (nonatomic ,copy) NSString *result;
@property (nonatomic ,copy) NSString *text;

@property (nonatomic ,strong) LYQUser *user;

@property (nonatomic ,assign) BOOL   success;
@end
