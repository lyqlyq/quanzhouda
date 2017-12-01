//
//  LYQAddressSaveTool.m
//  quanzhouda
//
//  Created by pro on 2017/11/29.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQAddressSaveTool.h"
#import "LYQAddressModel.h"
#define addressFileName [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"address.plist"]

#define countAddress 20

@implementation LYQAddressSaveTool


static NSMutableArray *_addressArr;

+(void)saveAddress:(LYQAddressModel *)model{
    
    
  
    
    _addressArr = [self getAddressModels];
    
    
    if (_addressArr == nil) {
        _addressArr = [NSMutableArray array];
    }
 
    __block BOOL isEqual = NO;
    
    [_addressArr enumerateObjectsUsingBlock:^(LYQAddressModel * objModel, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([model.name isEqualToString:objModel.name]) {
                
                [_addressArr removeObject:objModel];
                [_addressArr insertObject:objModel atIndex:0];
                
                isEqual = YES;
            }
        }];
    
    if (isEqual) {
       
    }else{
        if (_addressArr.count > countAddress) {
            [_addressArr removeLastObject];
        }
        [_addressArr insertObject:model atIndex:0];
    }
    if (_addressArr.count == 0) {
          [_addressArr insertObject:model atIndex:0];
    }
    
        [NSKeyedArchiver archiveRootObject:_addressArr toFile:addressFileName];
 
   
}

+(NSMutableArray *)getAddressModels{
    
    _addressArr = [NSKeyedUnarchiver unarchiveObjectWithFile:addressFileName];
    return _addressArr;
}

+(void)clearModels{
    _addressArr = [NSKeyedUnarchiver unarchiveObjectWithFile:addressFileName];
    [_addressArr removeAllObjects];
    _addressArr = nil;
    [NSKeyedArchiver archiveRootObject:_addressArr toFile:addressFileName];

}

@end
