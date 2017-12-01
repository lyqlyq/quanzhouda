//
//  LYQShunCarViewController.m
//  quanzhouda
//
//  Created by pro on 2017/11/13.
//  Copyright © 2017年 pro. All rights reserved.
//


#import "LYQShunCarViewController.h"

#import <ShareSDK/ShareSDK.h>

#import "LYQUserTool.h"
#import "LYQTopVIew.h"
#import "LYQContentView.h"
#import "LYQContentRightView.h"

#import "LYQShowUserMapController.h"
#import "LYQCerCarOwnerController.h"

#import "LYQHUD.h"
#import "LYQGoController.h"

#import "LYQMyAddress.h"

#import "LYQUserLocationTool.h"
#import "LYQUserLocationModel.h"

#define lyqTop_H 41
#define lyqSc_topV_Marge 15


@interface LYQShunCarViewController ()<topViewDelegete,UIScrollViewDelegate,LYQContentViewDelegate>


@property (nonatomic ,strong) UITextField *textF;

@property (nonatomic ,strong) UIScrollView *sc;

@property (nonatomic ,strong) LYQTopVIew *topView;

@property (nonatomic ,strong) LYQContentView *contentView;


@property (nonatomic ,strong) LYQUserLocationModel *userLocationModel;





@end

@implementation LYQShunCarViewController




-(void)setUpVC{

    self.topView = [[LYQTopVIew alloc] initWithFrame:CGRectMake(0, 0, screen_W, lyqTop_H)];
      self.topView.delegate = self;
      [self.view addSubview:self.topView];
    
    self.sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, lyqTop_H + lyqSc_topV_Marge, screen_W, self.view.xmg_height - LYQNavMaxY - lyqTop_H)];
      self.sc.contentSize = CGSizeMake(screen_W * 2, 0);
    self.sc.pagingEnabled = YES;
    self.sc.bounces = NO;
     LYQContentView *contentView = [LYQContentView contentView];
    
    contentView.frame = CGRectMake(0, 0, self.sc.xmg_width, self.sc.xmg_height);
    contentView.delegate = self;
    contentView.backgroundColor = [UIColor colorWithHexString:@"#f7f7f7"];
      _contentView = contentView;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7f7f7"];
    
    LYQContentRightView *reght = [LYQContentRightView rightView];
    reght.backgroundColor = contentView.backgroundColor;
    reght.frame = CGRectMake(screen_W, 0, screen_W, self.sc.xmg_height);
    
    reght.block = ^(){
        LYQCerCarOwnerController *car = [[LYQCerCarOwnerController alloc] init];
        car.title = @"认证审核";
        [self.navigationController pushViewController:car animated:YES];
        
    };
    [self.sc addSubview:reght];
    [self.sc addSubview:contentView];
    
    __weak typeof(self) weakSelf = self;
    [LYQUserLocationTool startUserLocationSuccess:^(LYQUserLocationModel *model) {
        weakSelf.userLocationModel = model;
        weakSelf.contentView.address = model.AOIName;
    } failure:^(NSError *error) {
        
    }];
    
    
    [self.view addSubview:self.sc];
    
    
    
    self.sc.delegate = self;
    
    
    
    
}


- (void)viewDidLoad {
      [super viewDidLoad];
    
    
}


#pragma mark -----------------topView--delegate---------------------
-(void)topView:(LYQTopVIew *)view selectBtn:(UIButton *)seleBtn{
    
    CGFloat offset = (seleBtn.tag - 500) * [UIScreen mainScreen].bounds.size.width;
    [UIView animateWithDuration:0.2 animations:^{
          self.sc.contentOffset = CGPointMake(offset, 0);
    }];
  
    
}


#pragma mark -----------------sc- delegate--------------------
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
        self.topView.inderView_X = scrollView.contentOffset.x;

}
#pragma mark -----------------contentView Delegate---------------------

-(void)contentView:(LYQContentView *)contentView changeAddressLabelClick:(UILabel *)addressLabel{
    
    __weak typeof(self) weakSelf = self;
    
    LYQShowUserMapController *mapVC = [[LYQShowUserMapController alloc] init];

    mapVC.block = ^(LYQUserLocationModel *model){
        _contentView.address = model.AOIName;
        weakSelf.userLocationModel = model;
    };
    [self presentViewController:mapVC animated:YES completion:nil];
    
    
    
}



-(void)contentView:(LYQContentView *)contentView goAddressLabelClick:(UILabel *)goAddressLabel{
    
    
    LYQGoController *vc = [[LYQGoController alloc] init];
    
    vc.model = self.userLocationModel;
    
    [self presentViewController:vc animated:YES completion:nil];
}




@end
