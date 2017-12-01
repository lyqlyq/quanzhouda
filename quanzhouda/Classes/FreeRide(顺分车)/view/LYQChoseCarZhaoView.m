//
//  LYQChoseCarZhaoView.m
//  quanzhouda
//
//  Created by pro on 2017/11/23.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQChoseCarZhaoView.h"

@interface LYQChoseCarZhaoView ()



@property (nonatomic ,strong) UILabel *label1;
@property (nonatomic ,strong) UILabel *label2;

@property (nonatomic ,strong) UIButton *commintBtn;





@end

static UIImageView *_exmapleImageV ;
static UIView *_allView;

@implementation LYQChoseCarZhaoView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        _exmapleImageV = [[UIImageView alloc] init];
        _exmapleImageV.layer.cornerRadius = 4;
        _exmapleImageV.layer.masksToBounds = YES;
        _label1 = [[UILabel alloc] init];
        _label2 = [[UILabel alloc] init];
        
        _label1.text = @"1.请按照上方提示例图提交审核照片";
        _label2.text = @"2.照片要四角对齐，信息完整。如模糊，反光，缺失等， 将不予认证";
        _label2.numberOfLines = 0;
        _label1.font = sysFont(14);
        _label2.font = sysFont(14);

        _label1.textColor = [UIColor blackColor];
        _label2.textColor = _label1.textColor;

        _commintBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commintBtn setBackgroundColor:[UIColor colorWithHexString:@"#424551"]];
        [_commintBtn setTitle:@"上传照片" forState:UIControlStateNormal];
        _commintBtn.titleLabel.font = sysFont(15);

        _commintBtn.layer.cornerRadius = 5;
        _commintBtn.layer.masksToBounds = YES;
//
        _allView = [[UIView alloc] init];
        _allView.backgroundColor = [UIColor whiteColor];
//
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        
        [_allView addSubview:_exmapleImageV];
        [_allView addSubview:_label1];
        [_allView addSubview:_label2];
        [_allView addSubview:_commintBtn];
     
        [_commintBtn addTarget:self action:@selector(commintClick:) forControlEvents:UIControlEventTouchUpInside];
    
        [self addSubview:_allView];
        
        
    }
    
    return self;
    
}

-(void)commintClick:(UIButton *)commintBtn{
    
    
    [LYQChoseCarZhaoView dimiss];

    
    static NSString *postName = @"commintBtnClickPostName";

    [[NSNotificationCenter defaultCenter] postNotificationName:postName object:nil userInfo:nil];
    

    
}

static LYQChoseCarZhaoView * _carView;

+(void)showType:(pictureType)type{
  
    
    
    if (_carView == nil) {
        _carView = [[LYQChoseCarZhaoView alloc] initWithFrame:CGRectMake(0, 0, screen_W, screen_H)];
    }
    
    
    if (type == pictureTypeJiaZhao) {
        _exmapleImageV.image = [UIImage imageNamed:@"jiazheng"];
    }else{
        _exmapleImageV.image = [UIImage imageNamed:@"xingzheng"];

    }
    CGFloat allView_H = 369;

    _allView.transform = CGAffineTransformMakeTranslation(0, allView_H);
    
    [UIView animateWithDuration:0.3 animations:^{
        _allView.transform = CGAffineTransformIdentity;
      
        }];
    [[UIApplication sharedApplication].keyWindow addSubview:_carView];

}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    CGFloat allView_H = 369;
    CGFloat allView_X = 0;
    CGFloat allView_Y = screen_H - allView_H;
    CGFloat allView_W = screen_W;
    
    _allView.frame = CGRectMake(allView_X, allView_Y, allView_W, allView_H);
    
    
    CGFloat exmapleImageV_X = 15;
    CGFloat exmapleImageV_Y = 15;
    CGFloat exmapleImageV_W = screen_W - 2 * exmapleImageV_X;
    CGFloat exmapleImageV_H = 197;
    
    _exmapleImageV.frame = CGRectMake(exmapleImageV_X, exmapleImageV_Y, exmapleImageV_W, exmapleImageV_H);

    CGFloat label1_X = exmapleImageV_X;
    CGFloat label1_Y = CGRectGetMaxY(_exmapleImageV.frame) + 15;
    CGFloat label1_W = screen_W - label1_X;
    CGFloat label1_H = 14;

    _label1.frame = CGRectMake(label1_X, label1_Y, label1_W, label1_H);
    
    CGFloat label2_X = exmapleImageV_X;
    CGFloat label2_Y = CGRectGetMaxY(_label1.frame) + 14;
    CGFloat label2_W = screen_W - label2_X - 24;
    CGFloat label2_H = 34;
    
    _label2.frame = CGRectMake(label2_X, label2_Y, label2_W, label2_H);
    
    
    CGFloat commintBtn_X = 14;
    CGFloat commintBtn_Y = CGRectGetMaxY(_label2.frame) + 14;
    CGFloat commintBtn_W = screen_W - 2 * commintBtn_X;
    CGFloat commintBtn_H = 41;
    
    _commintBtn.frame = CGRectMake(commintBtn_X, commintBtn_Y, commintBtn_W, commintBtn_H);

}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [LYQChoseCarZhaoView dimiss];
}

+(void)dimiss{
    
    [UIView animateWithDuration:0.2 animations:^{
        _allView.xmg_y = screen_H;
    } completion:^(BOOL finished) {
        [_carView removeFromSuperview];
        
    }];
    
}

@end
