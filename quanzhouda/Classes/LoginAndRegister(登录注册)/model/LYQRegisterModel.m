//
//  LYQRegisterModel.m
//  quanzhouda
//
//  Created by pro on 2017/11/30.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQRegisterModel.h"

@implementation LYQRegisterModel


-(void)setResult:(NSString *)result{
    
    if ([result isEqualToString:@"0"]) {
        self.success = YES;
    }
    _result = result;
    
}

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{@"user":@"info"};
}


@end
