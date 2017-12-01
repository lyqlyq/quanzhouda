//
//  LYQHudView.m
//  quanzhouda
//
//  Created by pro on 2017/11/20.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQHudView.h"

@interface LYQHudView ()


@end

static UILabel *_tishiLabel = nil;
static  LYQHudView *_hud  = nil;

@implementation LYQHudView



-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        _tishiLabel = [[UILabel alloc] init];
        _tishiLabel.textColor = [UIColor whiteColor];
        _tishiLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:alphaColor];
        _tishiLabel.layer.cornerRadius = 3;
        _tishiLabel.layer.masksToBounds = YES;
        _tishiLabel.textAlignment = NSTextAlignmentCenter;
        _tishiLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_tishiLabel];
        
        
    }
    
    return self;
    
}

+(void)showInfo:(NSString *)info{

    CGFloat _tishiH = 36 ;

    if (_hud == nil) {
        _hud = [[LYQHudView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.height)];
        _hud.backgroundColor = [UIColor clearColor];
    }

    CGSize sizeToFit = [info boundingRectWithSize:CGSizeMake(MAXFLOAT, _tishiH) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_tishiLabel.font} context:nil].size;
    
    CGFloat _tishiW = sizeToFit.width + 30 ;
    CGFloat _tishiX = ([UIScreen mainScreen].bounds.size.width  -  _tishiW) * 0.5;
    CGFloat _tishiY = ([UIScreen mainScreen].bounds.size.height - _tishiH) * 0.5;
    _tishiLabel.frame = CGRectMake(_tishiX, _tishiY, _tishiW, _tishiH);
    _tishiLabel.transform  = CGAffineTransformMakeScale(0.001,0.001);
        _tishiLabel.text = info;
    [[UIApplication sharedApplication].keyWindow addSubview:_hud];

    
    [UIView animateWithDuration:0.7 animations:^{
        _tishiLabel.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.4 animations:^{
                _tishiLabel.transform  = CGAffineTransformMakeScale(0.001, 0.001);
            } completion:^(BOOL finished) {
                _tishiLabel.transform = CGAffineTransformIdentity;
                [_hud removeFromSuperview];
            }];
        });
    }];

}



@end
