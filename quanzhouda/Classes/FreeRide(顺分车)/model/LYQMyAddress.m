//
//  LYQMyAddress.m
//  quanzhouda
//
//  Created by pro on 2017/11/29.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQMyAddress.h"

@implementation LYQMyAddress


-(CLLocation *)startL{
    
    if (self.startLocation.length == 0) {
        return nil;
    }
    
    //   self.addressModel.startLocation = [NSString stringWithFormat:@"%f,%f",location.coordinate.longitude,location.coordinate.latitude];
    
    // 经度
    NSString *longitude =  [[self.startLocation componentsSeparatedByString:@","] firstObject];
    
    // 纬度
      NSString *latitude =  [[self.startLocation componentsSeparatedByString:@","] lastObject];
    
    CLLocation *l = [[CLLocation alloc] initWithLatitude:latitude.doubleValue longitude:longitude.doubleValue];
    
    
    return l;
    
    
}

-(CLLocation *)endL{
    
    if (self.endLocation.length == 0) {
        return nil;
    }
    // 经度
    NSString *longitude =  [[self.endLocation componentsSeparatedByString:@","] firstObject];
    
    // 纬度
    NSString *latitude =  [[self.endLocation componentsSeparatedByString:@","] lastObject];
    CLLocation *l = [[CLLocation alloc] initWithLatitude:latitude.doubleValue longitude:longitude.doubleValue];
    
    
    return l;
    
}

@end
