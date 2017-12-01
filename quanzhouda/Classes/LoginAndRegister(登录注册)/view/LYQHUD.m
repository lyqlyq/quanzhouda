//
//  LYQHUD.m
//  quanzhouda
//
//  Created by pro on 2017/11/24.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQHUD.h"

@interface LYQHUD ()
@property (weak, nonatomic) IBOutlet UIView *hudeVIew;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indeAmina;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end


@implementation LYQHUD

-(void)awakeFromNib{
    
    [super awakeFromNib];
    self.hudeVIew.layer.cornerRadius = 4;
    self.hudeVIew.layer.masksToBounds = YES;
    self.hudeVIew.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:alphaColor];
    
    self.backgroundColor = [UIColor clearColor];
    
}

static LYQHUD * _netHUD;

+(void)showDefaluInfo{
    
    if (_netHUD == nil) {
        _netHUD = [LYQHUD xmg_viewFromXib];
        _netHUD.frame = CGRectMake(0, 0, screen_W, screen_H);

    }
    [[UIApplication sharedApplication].keyWindow addSubview:_netHUD];
}

+(void)showMessage:(NSString *)message{
    if (_netHUD == nil) {
        _netHUD = [LYQHUD xmg_viewFromXib];
        _netHUD.frame = CGRectMake(0, 0, screen_W, screen_H);
    }
    
    _netHUD.infoLabel.text = message;
    
 
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication].keyWindow addSubview:_netHUD];
    });
}

+(void)dissmiss{
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [_netHUD removeFromSuperview];
    });
   
    
}

@end
