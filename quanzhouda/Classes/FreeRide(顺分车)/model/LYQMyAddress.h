//
//  LYQMyAddress.h
//  quanzhouda
//
//  Created by pro on 2017/11/29.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LYQMyAddress : NSObject

@property (nonatomic ,copy) NSString *startLocation;
@property (nonatomic ,copy) NSString *endLocation;

@property (nonatomic ,strong) NSString *startAddress;
@property (nonatomic ,strong) NSString *endAddress;
@property (nonatomic ,copy) NSString *city;




//开始的经纬度
@property (nonatomic ,strong) CLLocation *startL;

//结束的经纬度
@property (nonatomic ,strong) CLLocation *endL;



@end
