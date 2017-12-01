//
//  LYQPushController.m
//  quanzhouda
//
//  Created by pro on 2017/11/29.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQPushController.h"

#import "LYQChoseTimeView.h"
#import <MAMapKit/MAMapKit.h>

#import <CoreLocation/CoreLocation.h>

#import "LYQPushPlaceParam.h"
#import "LYQPushPlaceRequest.h"

@interface LYQPushController ()
@property (weak, nonatomic) IBOutlet UILabel *startAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *endAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *userCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UIView *v1;
@property (weak, nonatomic) IBOutlet UIView *v2;
@property (weak, nonatomic) IBOutlet UIView *v3;
@property (weak, nonatomic) IBOutlet UIView *v4;
@property (weak, nonatomic) IBOutlet UIView *allV;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIView *moneyView;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

@property (nonatomic ,strong) NSMutableArray *countsUserArr;

@property (nonatomic ,copy) NSString *startTimeStr;



@end

@implementation LYQPushController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allV.layer.cornerRadius = 3;
    self.allV.layer.masksToBounds = YES;
    
    self.moneyView.layer.cornerRadius = 3;
    self.moneyView.layer.masksToBounds = YES;
    
    self.startBtn.layer.cornerRadius = 3;
    self.startBtn.layer.masksToBounds = YES;
    
    
    
    self.startAddressLabel.text = self.userStartModel.AOIName;
    self.endAddressLabel.text = self.userEndModel.AOIName;
    
    self.countsUserArr = [NSMutableArray array];
    
    for (NSInteger i = 1 ; i < 7; i ++) {
        [self.countsUserArr addObject:[NSString stringWithFormat:@"%ld",i]];
    }
    
    
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(v4Tap)];
    [self.v4 addGestureRecognizer:tap4];
    
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(v3Tap)];
    [self.v3 addGestureRecognizer:tap3];
    //NSLog(@"%@",self.address);
    
     // 距离
     NSString *distance =   [self getHowMoenyStartLocation:self.userStartModel.location endLocation:self.userEndModel.location];
    
    
    // 单价8 元
    double  p  =  distance.doubleValue * 0.001 * 8;
    
    NSString *str = @"元起";
    NSString *price = [NSString stringWithFormat:@"%.1f%@",p,str];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:price];
    // 创建后改变属性
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName] = [UIColor blackColor];
    attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];

    //1set
    [string setAttributes:attributes range:NSMakeRange(0, price.length - 2)];
    
    NSMutableDictionary *attributes2 = [NSMutableDictionary dictionary];
    attributes2[NSForegroundColorAttributeName] = [UIColor blackColor];
    attributes2[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    [string setAttributes:attributes2 range:NSMakeRange(price.length - 2, str.length)];
  
    self.moneyLabel.attributedText = string;
    
 
}

// 选择时间
-(void)v4Tap{
    
 [LYQChoseTimeView showTitle:nil data:nil].sureBtnClick = ^(NSString *choseTime, NSString *date) {
        self.startTimeLabel.text = choseTime;
     self.startTimeLabel.textColor = self.endAddressLabel.textColor;
     self.startTimeStr = date;
     
    };
    
}
-(void)v3Tap{

    [LYQChoseTimeView showTitle:@"选择人数" data:self.countsUserArr].sureBtnClick = ^(NSString *choseTime, NSString *date) {
        self.userCountLabel.text = choseTime;
        self.userCountLabel.textColor = self.endAddressLabel.textColor;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self v4Tap];
 
        });
        
       
    };;
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
    [self v3Tap];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)diss:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSString *)getHowMoenyStartLocation:(CLLocation *)statrLocation  endLocation:(CLLocation *)endLocation{
    
    
  

    
    
    
    MAMapPoint point1 = MAMapPointForCoordinate(statrLocation.coordinate);
    MAMapPoint point2 = MAMapPointForCoordinate(endLocation.coordinate);
    CLLocationDistance distance = MAMetersBetweenMapPoints(point1,point2);
    NSLog(@"statrLocation--%@",statrLocation);
    NSLog(@"endLocation-- %@",endLocation);
    NSLog(@"%f",distance);
    
    return [NSString stringWithFormat:@"%f",distance];
    
}
// 发布行程
- (IBAction)pushBtnClick:(UIButton *)sender {
    

    
    LYQPushPlaceParam *param = [[LYQPushPlaceParam alloc] init];
    param.dt_start = self.userStartModel.AOIName;
    param.dt_end = self.userEndModel.AOIName;
    param.dt_surplus = self.userCountLabel.text;
    param.dt_money = self.moneyLabel.text;
    param.dt_time = self.startTimeStr;
    param.l_statrlat = [NSString stringWithFormat:@"%f",self.userStartModel.location.coordinate.latitude];
      param.l_startlong = [NSString stringWithFormat:@"%f",self.userStartModel.location.coordinate.longitude];
    
    param.l_endlat = [NSString stringWithFormat:@"%f",self.userEndModel.location.coordinate.latitude];
    param.l_endlong = [NSString stringWithFormat:@"%f",self.userEndModel.location.coordinate.longitude];
    
    [LYQPushPlaceRequest POSTPushPlaceParam:param success:^(LYQPushPlaceModel *model) {
        
    } failure:^(NSError *error) {
        
    }];
    
    
    
}
@end
