//
//  LYQShowUserMapController.m
//  quanzhouda
//
//  Created by pro on 2017/11/23.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQShowUserMapController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import "LYQShangCheView.h"
#import "LYQUserLocationModel.h"
#define ptview_W 75

@interface LYQShowUserMapController ()<MAMapViewDelegate,AMapSearchDelegate>

@property (nonatomic ,strong) AMapReGeocodeSearchRequest *regeo;

@property (nonatomic, strong) AMapSearchAPI *search;

@property (nonatomic ,strong) MAMapView *mapView;

@property (nonatomic, strong) UIImageView *pointview;

@property (nonatomic ,strong) UILabel *addressLabel;

@property (nonatomic ,strong) LYQShangCheView *shangView;

@property (nonatomic ,strong) UIView *v;

@property (nonatomic ,strong) UILabel *la;

@property (nonatomic ,copy) NSString *location;

@property (nonatomic ,strong) LYQUserLocationModel *model;


@end

@implementation LYQShowUserMapController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.model = [[LYQUserLocationModel alloc ] init];
    
    [self setUpMapView];
    
    
    [self setUpPointView];
    
    [self setUpRegeo];
    
    self.shangView = [[LYQShangCheView alloc] initWithFrame:CGRectMake(15,25, screen_W - 30, 50)];
    [self.shangView.sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_shangView];
    
}

// 确定按钮
-(void)sureBtnClick{
   
    if (self.block) {
        self.block(self.model);
    }
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)setUpMapView{
    self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    _mapView.customizeUserLocationAccuracyCircleRepresentation = YES;
    _mapView.showsCompass = NO;
    _mapView.showsIndoorMap = NO;
    _mapView.rotateEnabled = YES;
      _mapView.showsScale = NO;
      _mapView.distanceFilter=5;
     _mapView.zoomLevel = 16;
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MAUserTrackingModeFollow;

    self.mapView.delegate = self;

    [self.view addSubview:self.mapView];

}

 //初始中心控件View
-(void)setUpPointView{

    
    CGFloat imageV_Y = 0;
    CGFloat imageV_X = 0;
    CGFloat imageV_H = 40;
    CGFloat imageV_W = ptview_W;
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(imageV_X, imageV_Y,imageV_W ,imageV_H)];
    imageV.image = [UIImage imageNamed:@"address"];
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(imageV_X,imageV_Y , imageV_W, imageV_H)];
    [v addSubview:imageV];
    
    _v = v;
    
    UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ptview_W, imageV_H - 15)];
    
    
    
    
    la.text = @"在这里上车";
    _la = la;
    la.font = sysFont(14);
    la.textAlignment = NSTextAlignmentCenter;
    [v addSubview:la];
    
    
    CGFloat point_H = 30;
    CGFloat point_W = 19;
    CGFloat point_X = (imageV_W - point_W) * 0.5;
    CGFloat point_Y = imageV_H + 10;

    
    _pointview =[[UIImageView alloc]initWithFrame:CGRectMake(point_X, point_Y,point_W,point_H )];
    _pointview.image =[UIImage imageNamed:@"icon"];

    CGFloat ptView_W = ptview_W;
    CGFloat ptView_H = ptview_W;
    CGFloat ptView_X = (screen_W - ptView_W) * 0.5;
    CGFloat ptView_Y = (screen_H - ptView_H) * 0.5 - ptview_W * 0.5;


    
    UIView *ptView = [[UIView alloc] initWithFrame:CGRectMake(ptView_X, ptView_Y, ptView_W, ptView_H)];
    ptView.backgroundColor = [UIColor clearColor];
    
    [ptView addSubview:_pointview];
    [ptView addSubview:v];
    [_mapView addSubview:ptView];
    
    

}

// 初始反地理编码

-(void)setUpRegeo{
    self.regeo = [[AMapReGeocodeSearchRequest alloc] init];
    self.search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
}


- (void)mapView:(MAMapView *)mapView mapWillMoveByUser:(BOOL)wasUserAction{

    NSLog(@"----");
    
    [UIView animateWithDuration:0.2 animations:^{
        self.v.transform = CGAffineTransformMakeTranslation(0, -10);
    } completion:^(BOOL finished) {
        self.v.hidden = YES;
    }];
    
    
  
    
}

- (void)mapView:(MAMapView *)mapView mapDidMoveByUser:(BOOL)wasUserAction {


    [UIView animateWithDuration:0.5 animations:^{
        self.pointview.transform =CGAffineTransformMakeTranslation(0,-10.0);
     
    } completion:^(BOOL finished) {
        self.pointview.transform = CGAffineTransformIdentity;
        self.v.transform = CGAffineTransformMakeScale(0.001, 0.001);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.v.hidden = NO;
            [UIView animateWithDuration:0.2 animations:^{
                self.v.transform = CGAffineTransformIdentity;

            }];
        });
        
      
    }];

    self.regeo.location = [AMapGeoPoint locationWithLatitude:self.mapView.region.center.latitude longitude:self.mapView.region.center.longitude];
    self.regeo.requireExtension = NO;
    [self.search AMapReGoecodeSearch:_regeo];

}

-(void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response{
    
    
    AMapAddressComponent *component =  response.regeocode.addressComponent;
    NSLog(@"%@",response.regeocode.mj_keyValues);
    
        NSString *tiaddress = [NSString stringWithFormat:@"%@%@%@",component.district,component.streetNumber.street,component.streetNumber.number];
    self.shangView.tiAddress = tiaddress;
    CLLocation *lo = [[CLLocation alloc] initWithLatitude: component.streetNumber.location.latitude longitude: component.streetNumber.location.longitude];
    self.model.location = lo;
    self.model.AOIName = component.neighborhood.length > 0 ? component.neighborhood : tiaddress;

    self.shangView.address = component.neighborhood.length > 0 ? component.neighborhood : @"当前位置";
    

}




@end
