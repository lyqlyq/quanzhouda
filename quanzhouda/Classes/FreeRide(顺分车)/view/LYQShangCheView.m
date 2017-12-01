
//
//  LYQShangCheView.m
//  quanzhouda
//
//  Created by pro on 2017/11/23.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQShangCheView.h"

@interface LYQShangCheView ()


@property (nonatomic ,strong) UIButton *tiBtn;

@property (nonatomic ,strong) UILabel *addressLabel;

@property (nonatomic ,strong) UILabel *tiAddressLabel;



@end



@implementation LYQShangCheView


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _tiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _addressLabel = [[UILabel alloc] init];
        _tiAddressLabel = [[UILabel alloc] init];

        [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        
     
        
        [_sureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _sureBtn.titleLabel.font = sysFont(14);
        
        
        _tiBtn.titleLabel.font = sysFont(10);
        _tiBtn.layer.cornerRadius = 8;
        _tiBtn.layer.masksToBounds = YES;
        [_tiBtn setTitle:@"起" forState:UIControlStateNormal];
        [_tiBtn setBackgroundColor:[UIColor orangeColor]];
      
        
        _addressLabel.text = @"获取上车地点...";
        _addressLabel.font = sysFont(14);
        
        _tiAddressLabel.text = @"获取位置...";
        _tiAddressLabel.font = sysFont(12);
        _tiAddressLabel.textColor = [UIColor colorWithHexString:@"#888888"];
        
        [self addSubview:_sureBtn];
        [self addSubview:_addressLabel];
        [self addSubview:_tiBtn];
        [self addSubview:_tiAddressLabel];
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
    }
    
    return self;
    
}

-(void)setAddress:(NSString *)address{
    
    
    _address = address;
    self.addressLabel.text = address;
    
}

-(void)setTiAddress:(NSString *)tiAddress{
    
    _tiAddress = tiAddress;
    self.tiAddressLabel.text = tiAddress;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat tiBtn_X = 5;
    CGFloat tiBtn_H = 16;
    CGFloat tiBtn_W = 16;
    CGFloat tiBtn_Y = (self.xmg_height - tiBtn_H) * 0.5;
    
    _tiBtn.frame = CGRectMake(tiBtn_X, tiBtn_Y, tiBtn_W, tiBtn_H);
    
    CGFloat addressLabel_X = tiBtn_X + tiBtn_W + 10;
    CGFloat addressLabel_Y = 15;
    CGFloat addressLabel_H = 10;
    CGFloat addressLabel_W = self.xmg_width - 20;
    
    _addressLabel.frame = CGRectMake(addressLabel_X, addressLabel_Y, addressLabel_W, addressLabel_H);


    
    
    CGFloat  tiAddressLabel_X = addressLabel_X;
    CGFloat  tiAddressLabel_Y = addressLabel_Y + addressLabel_H + 10;
    CGFloat  tiAddressLabel_W = addressLabel_W;
    CGFloat  tiAddressLabel_H = addressLabel_H;
    
    _tiAddressLabel.frame = CGRectMake(tiAddressLabel_X, tiAddressLabel_Y, tiAddressLabel_W, tiAddressLabel_H);
    
    CGFloat sureBtn_H = 40;
    CGFloat sureBtn_W = 50;
    CGFloat sureBtn_X = self.xmg_width -sureBtn_W - 20;
    CGFloat sureBtn_Y = (self.xmg_height - sureBtn_H) * 0.5;
    

    _sureBtn.frame = CGRectMake(sureBtn_X, sureBtn_Y, sureBtn_W, sureBtn_H);
    
    
}

@end
