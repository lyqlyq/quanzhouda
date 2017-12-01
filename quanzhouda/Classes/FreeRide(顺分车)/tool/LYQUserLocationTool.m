//
//  LYQUserLocationTool.m
//  quanzhouda
//
//  Created by pro on 2017/11/30.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQUserLocationTool.h"
#import <AMapLocationKit/AMapLocationKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

#import "LYQUserLocationModel.h"

@interface LYQUserLocationTool ()<AMapLocationManagerDelegate>



@end
@implementation LYQUserLocationTool

static AMapLocationManager * _locationMgr = nil;


/**定位用户位置*/
+ (void)startUserLocationSuccess:(void(^)(LYQUserLocationModel *model))success failure:(void(^)(NSError *error))failure{
    
    if (_locationMgr == nil) {
        _locationMgr = [[AMapLocationManager alloc] init];
       
        _locationMgr.pausesLocationUpdatesAutomatically = NO;
        _locationMgr.desiredAccuracy = kCLLocationAccuracyKilometer;
        
        
    }

    
    if ([self checkUserLocation]) {
        [LYQHUD showMessage:@"定位中..."];
        [_locationMgr requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
            NSLog(@"%@",regeocode.mj_keyValues);
            [LYQHUD dissmiss];
            
            if (regeocode) {
                
                LYQUserLocationModel *model = [LYQUserLocationModel mj_objectWithKeyValues:regeocode.mj_keyValues];
                model.location = location;
                
                if (success) {
                    success(model);
                }
            }
            
        }];
    }else{
         [LYQHUD dissmiss];
        show(@"请开启位置访问权限");
        
    }
    
}

+ (BOOL)checkUserLocation{
    
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted) {
        return NO;
    }    
    return YES;

}





@end
