//
//  LYQSureAndCancleView.m
//  quanzhouda
//
//  Created by pro on 2017/11/22.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQSureAndCancleView.h"

#define bottom_H 100 + 5

@interface LYQSureAndCancleView ()

@property (nonatomic ,strong) UIButton *sureBtn;
@property (nonatomic ,strong) UIButton *cancleBtn;
@property (nonatomic ,strong) UIView *lineView;



@end
@implementation LYQSureAndCancleView

static UIView  *_bootemView;


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _lineView = [[UIView  alloc] init];
        _bootemView = [[UIView alloc] init];
        
        
        [_sureBtn setTitle:@"确定退出" forState:UIControlStateNormal];
        [_cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        
   
        
        [_cancleBtn addTarget:self action:@selector(cancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        [_sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
        

        _sureBtn.backgroundColor = [UIColor whiteColor];
        _cancleBtn.backgroundColor = [UIColor whiteColor];
        
        
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#cdcdcd"];
        _bootemView.backgroundColor = _lineView.backgroundColor;
        
        
        _sureBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:17.f];
        [_sureBtn setTitleColor:[UIColor colorWithR:221 g:66 b:70] forState:UIControlStateNormal];
        [_cancleBtn setTitleColor:[UIColor colorWithR:16 g:16 b:16] forState:UIControlStateNormal];

   
       
        
        
        
        
        [_bootemView addSubview:_sureBtn];
        [_bootemView addSubview:_cancleBtn];
        [_bootemView addSubview:_lineView];
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:alphaColor];
        
        [self addSubview:_bootemView];
        
    }
    
    return self;
    
}

static  LYQSureAndCancleView *_v;

-(void)cancleBtnClick{
    
    if (self.cancleBlock) {
        self.cancleBlock(nil);
    }
    
    [LYQSureAndCancleView dissmiss];

}

-(void)sureBtnClick{
  
    if (self.block) {
        self.block(nil);
    }
  
}

-(void)setSureBtnText:(NSString *)sureBtnText{
    _sureBtnText = sureBtnText;
    
    [_sureBtn setTitle:sureBtnText forState:UIControlStateNormal];
    
    
}

-(void)setSureBtnColor:(UIColor *)sureBtnColor{
    _sureBtnColor = sureBtnColor;
    [_sureBtn setTitleColor:sureBtnColor forState:UIControlStateNormal];
}

-(void)setCancleBtnText:(NSString *)cancleBtnText{
    
    _cancleBtnText = cancleBtnText;
    
    [_cancleBtn setTitle:cancleBtnText forState:UIControlStateNormal];

    
}

-(void)setCancleBtnColor:(UIColor *)cancleBtnColor{
    
    _cancleBtnColor = cancleBtnColor;
    [_cancleBtn setTitleColor:cancleBtnColor forState:UIControlStateNormal];
    
}

+(LYQSureAndCancleView *)sureAndCancleView{
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat h = screen_H;
    CGFloat w = screen_W;
    
    if (_v == nil) {
        _v = [[LYQSureAndCancleView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    }
    
    return _v;
    
}

-(void)showView{
    [LYQSureAndCancleView show];
}

+(LYQSureAndCancleView *)show{
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat h = screen_H;
    CGFloat w = screen_W;
   
    if (_v == nil) {
        _v = [[LYQSureAndCancleView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    }
    
    
    _bootemView.transform = CGAffineTransformMakeTranslation(0, bottom_H);
    
    [UIView animateWithDuration:0.3 animations:^{
        _bootemView.transform = CGAffineTransformIdentity;
    }];
    
    [[UIApplication sharedApplication].keyWindow addSubview:_v];
    
    
    return _v;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [LYQSureAndCancleView dissmiss];
}

+(void)dissmiss{
    

    CGFloat bootom_Y = screen_H;
  
    _bootemView.transform = CGAffineTransformIdentity;

    [UIView animateWithDuration:0.2 animations:^{
        _bootemView.xmg_y = bootom_Y;
    }completion:^(BOOL finished) {
        [_v removeFromSuperview];

    } ];
    
    
}


-(void)layoutSubviews{
    [super layoutSubviews];

    CGFloat h = bottom_H;
    
     CGFloat suerBtn_X = 0;
     CGFloat suerBtn_Y = 0;
     CGFloat suerBtn_H = 50;
     CGFloat suerBtn_W = screen_W;
    
    _sureBtn.frame = CGRectMake(suerBtn_X, suerBtn_Y,suerBtn_W, suerBtn_H);
    
    CGFloat line_X = 0;
    CGFloat line_Y = suerBtn_H;
    CGFloat line_W = screen_W;
    CGFloat line_H = 5;
    _lineView.frame = CGRectMake(line_X, line_Y, line_W, line_H);
    
    
    CGFloat cancle_X = 0;
    CGFloat cancle_Y = suerBtn_H + line_H;
    CGFloat cancle_W = suerBtn_W;
    CGFloat cancle_H = suerBtn_H;
    
    _cancleBtn.frame = CGRectMake(cancle_X, cancle_Y, cancle_W, cancle_H);
    


    CGFloat bootom_X = 0;
    CGFloat bootom_Y = screen_H - h;
    CGFloat bootom_H = h;
    CGFloat bootom_W = screen_W;
    
    _bootemView.frame = CGRectMake(bootom_X, bootom_Y, bootom_W, bootom_H);

    
}


@end
