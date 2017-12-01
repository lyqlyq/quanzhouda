//
//  LYQUserLocationModel.m
//  quanzhouda
//
//  Created by pro on 2017/11/30.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQUserLocationModel.h"

@implementation LYQUserLocationModel


-(NSString *)AOIName{
    
    if (_AOIName.length == 0) {
        _AOIName = [NSString stringWithFormat:@"%@%@%@",_district,_street,_number];
    }
    
    return _AOIName;
    
}


@end
