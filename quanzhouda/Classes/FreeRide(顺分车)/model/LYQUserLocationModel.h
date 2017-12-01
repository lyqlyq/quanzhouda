//
//  LYQUserLocationModel.h
//  quanzhouda
//
//  Created by pro on 2017/11/30.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>


/*
 AOIName = "保利·香槟国际";
 POIName = "保利·香槟国际";
 adcode = 510117;
 city = "成都市";
 citycode = 028;
 country = "中国";
 district = "郫都区";
 formattedAddress = "四川省成都市郫都区百草路靠近保利·香槟国际";
 number = "157号";
 province = "四川省";
 street = "百草路";
 */
@interface LYQUserLocationModel : NSObject

@property (nonatomic ,copy) NSString *AOIName;
@property (nonatomic ,copy) NSString *POIName;
@property (nonatomic ,copy) NSString *adcode;
@property (nonatomic ,copy) NSString *city;
@property (nonatomic ,copy) NSString *citycode;
@property (nonatomic ,copy) NSString *country;
@property (nonatomic ,copy) NSString *district; // 区
@property (nonatomic ,copy) NSString *formattedAddress;
@property (nonatomic ,copy) NSString *number;
@property (nonatomic ,copy) NSString *province;
@property (nonatomic ,copy) NSString *street; // 路

@property (nonatomic ,strong) CLLocation *location;




@end
