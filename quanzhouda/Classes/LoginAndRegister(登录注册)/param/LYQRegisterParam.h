//
//  LYQRegisterParam.h
//  quanzhouda
//
//  Created by pro on 2017/11/30.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQLoginAndRegistBaseParam.h"

@interface LYQRegisterParam : LYQLoginAndRegistBaseParam
@property (nonatomic ,copy) NSString *code;
@property (nonatomic ,copy) NSString *password;
@end
