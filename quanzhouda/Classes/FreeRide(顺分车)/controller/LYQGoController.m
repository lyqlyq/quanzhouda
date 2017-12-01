//
//  LYQGoController.m
//  quanzhouda
//
//  Created by pro on 2017/11/29.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQGoController.h"
#import <AMapLocationKit/AMapLocationKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import <CoreLocation/CoreLocation.h>

#import "LYQHUD.h"

#import "LYQAddressModel.h"
#import "LYQAddressCell.h"

#import "LYQAddressSaveTool.h"

#import "LYQPushController.h"

#import "LYQLocaModel.h"

@interface LYQGoController ()<UITextFieldDelegate,AMapSearchDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *cityBtn;

@property (weak, nonatomic) IBOutlet UITableView *tab;
@property (nonatomic ,strong) AMapLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UITextField *addressText;

@property (nonatomic ,strong) AMapSearchAPI *search;

@property (nonatomic ,strong) AMapInputTipsSearchRequest *tipsRequest;

@property (nonatomic ,strong) NSMutableArray *addressModels;


@property (nonatomic ,strong) UILabel *historyLabel;




@end

@implementation LYQGoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.addressText.delegate = self;
    
    self.search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
    
     self.tipsRequest = [[AMapInputTipsSearchRequest alloc] init];
    
     self.addressModels = [LYQAddressSaveTool getAddressModels];
    
    
    self.tab.rowHeight = 76;
    self.tab.separatorColor = [UIColor clearColor];
    
    self.tab.layer.borderWidth = 1;
    self.tab.layer.borderColor = [UIColor colorWithHexString:@"#eeeeee"].CGColor;
    
    self.tab.layer.cornerRadius =5;
    self.tab.layer.masksToBounds = YES;
    
    UILabel *La  = [[ UILabel alloc] init];
    La.frame = CGRectMake(0, 0, screen_H, 40);
    La.textAlignment = NSTextAlignmentCenter;
    La.text = @"历史搜索记录";
    La.font = sysFont(14);
    La.textColor = [UIColor colorWithHexString:@"#aaaaaa"];
    _historyLabel = La;
    self.tab.tableFooterView  = _historyLabel;;
  
    self.tipsRequest.city = self.model.city;
    self.tipsRequest.cityLimit = YES;
    // @"116.481488,39.990464",(经度,latitude)
    NSString *strLocation = [NSString stringWithFormat:@"%f,%f",self.model.location.coordinate.longitude,self.model.location.coordinate.latitude];
    self.tipsRequest.location = strLocation;
    self.cityBtn.titleLabel.text = self.model.city;
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    self.tipsRequest.keywords = [NSString stringWithFormat:@"%@%@",self.addressText.text,string];

    [self.search AMapInputTipsSearch: self.tipsRequest];

    return YES;

}

- (IBAction)diss:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)choseCity:(UIButton *)sender {
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.addressModels.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LYQAddressCell *cell = [LYQAddressCell addressCellWithTab:tableView];
    
    cell.model = self.addressModels[indexPath.row];
    
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LYQAddressModel *model =self.addressModels[indexPath.row];
    [LYQAddressSaveTool saveAddress:model];
    
    LYQUserLocationModel * userEndModel = [[LYQUserLocationModel alloc] init];
    
    userEndModel.AOIName = model.name;
    userEndModel.location = [[CLLocation alloc] initWithLatitude:model.location.latitude.doubleValue longitude:model.location.longitude.doubleValue];
    
    LYQPushController *push = [[LYQPushController alloc] init];
    push.userStartModel = self.model;
    push.userEndModel = userEndModel;
    [self presentViewController:push animated:YES completion:nil];

}


-(void)onInputTipsSearchDone:(AMapInputTipsSearchRequest *)request response:(AMapInputTipsSearchResponse *)response{
    
    
    
    self.addressModels = [LYQAddressModel mj_objectArrayWithKeyValuesArray:response.tips context:nil];

    if (self.addressModels.count > 0) {
        self.historyLabel.hidden = YES;
    }else{
        self.addressModels  = [LYQAddressSaveTool getAddressModels];
        self.historyLabel.hidden = NO;
    }
    [self.tab reloadData];

    NSLog(@"%@",response.mj_keyValues);

}

@end
