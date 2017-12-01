//
//  LYQTopVIew.m
//  quanzhouda
//
//  Created by pro on 2017/11/21.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQTopVIew.h"

@interface LYQTopVIew()

@property (nonatomic ,strong) UIButton *sheBtn;
@property (nonatomic ,strong) UIButton *jiBtn;
@property (nonatomic ,strong) UIView *inderView;


@end

@implementation LYQTopVIew

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        _sheBtn = [[UIButton alloc] init];
        _jiBtn = [[UIButton alloc] init];
        _inderView = [[UIView alloc] init];
        
        _sheBtn.tag = 500;
        _jiBtn.tag = 501;
        
        _inderView.backgroundColor = [UIColor orangeColor];
        _inderView.layer.cornerRadius = 1;
        
        
        _sheBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _jiBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_sheBtn setSelected:YES];

        
        [_sheBtn setTitle:@"乘客" forState:UIControlStateNormal];
        [_jiBtn setTitle:@"车主" forState:UIControlStateNormal];
        
        [_sheBtn setTitleColor:[UIColor colorWithHexString:@"#424142"] forState:UIControlStateNormal];
        [_sheBtn setTitleColor:[UIColor colorWithHexString:@"#ED7D47"] forState:UIControlStateSelected];
        
        [_jiBtn setTitleColor:[UIColor colorWithHexString:@"#424142"] forState:UIControlStateNormal];
        [_jiBtn setTitleColor:[UIColor colorWithHexString:@"#ED7D47"] forState:UIControlStateSelected];
        
        _inderView_W = 34;
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.shadowColor = [UIColor colorWithHexString:@"#d1d1d1"].CGColor;
        self.layer.shadowOffset = CGSizeMake(5, 9);
        self.layer.shadowOpacity = 0.75;
        self.layer.shadowRadius = 3;
        
        [self addSubview:_sheBtn];
        [self addSubview:_jiBtn];
        [self addSubview:_inderView];
        
        [_sheBtn addTarget:self action:@selector(sheBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
         [_jiBtn addTarget:self action:@selector(jiBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        


    }
    
    return self;
    
}

+(LYQTopVIew *)topView{
    
    LYQTopVIew *topView = [[LYQTopVIew alloc] init];
    
    
    return topView;
}

-(void)setOneText:(NSString *)oneText{
    _oneText = oneText;
    [_sheBtn setTitle:oneText forState:UIControlStateNormal];
    
    
    
    
}

-(void)setTwoText:(NSString *)twoText{
    _twoText = twoText;
    [_jiBtn setTitle:twoText forState:UIControlStateNormal];
    
}

-(void)setInderView_W:(CGFloat)inderView_W{
    _inderView_W = inderView_W;
    
    _inderView.xmg_width = inderView_W;
}

-(void)sheBtnClick:(UIButton *)sheBtn{
    
    [self.jiBtn setSelected:NO];
    [self.sheBtn setSelected:YES];
    
    CGFloat inderView_X = self.inderView.xmg_x  - self.jiBtn.xmg_width;

    [UIView animateWithDuration:0.2 animations:^{
    
        if (self.inderView.xmg_x < self.sheBtn.xmg_width) {
            return ;
        }else{
            self.inderView.xmg_x = inderView_X;
        }
     
        
    }];
    
    [self.delegate topView:self selectBtn:sheBtn];
}

-(void)jiBtnClick:(UIButton *)jiBtn{
    [self.jiBtn setSelected:YES];
    [self.sheBtn setSelected:NO];
    CGFloat inderView_X = self.inderView.xmg_x  + self.jiBtn.xmg_width;
    
    [UIView animateWithDuration:0.2 animations:^{
        if (self.inderView.xmg_x > self.jiBtn.xmg_width) {
            return ;
        }else{
            self.inderView.xmg_x = inderView_X;
        }
        
        
    }];
    
    [self.delegate topView:self selectBtn:jiBtn];

}

-(void)setInderView_X:(CGFloat)inderView_X{
    
    if (inderView_X > 200) {
        [self jiBtnClick:self.jiBtn];
    }else{
        
        [self sheBtnClick:self.sheBtn];
    }
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    CGFloat sheBtnX = 0;
    CGFloat sheBtnY = 0;
    CGFloat sheBtnW = width * 0.5;
    CGFloat sheBtnH = height - 3;
    
    _sheBtn.frame = CGRectMake(sheBtnX, sheBtnY, sheBtnW, sheBtnH);
    
    CGFloat jiBtnX = sheBtnW;
    CGFloat jiBtnY = 0;
    CGFloat jiBtnW = sheBtnW;
    CGFloat jiBtnH = sheBtnH;
    
    _jiBtn.frame = CGRectMake(jiBtnX, jiBtnY, jiBtnW, jiBtnH);
    
    CGFloat  inderViewW = _inderView_W;
    CGFloat  inderViewX = (sheBtnW - inderViewW) * 0.5;
    CGFloat  inderViewY = sheBtnH;
    CGFloat  inderViewH = 3;
    
    _inderView.frame = CGRectMake(inderViewX, inderViewY, inderViewW, inderViewH);

}

@end
