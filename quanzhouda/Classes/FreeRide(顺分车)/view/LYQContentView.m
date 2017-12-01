//
//  LYQContentView.m
//  quanzhouda
//
//  Created by pro on 2017/11/21.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQContentView.h"


#define  mainColor [UIColor orangeColor]
#define disSeleColor  [UIColor colorWithHexString:@"#414142"]

@interface LYQContentView()
@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIView *thereView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inderVIew_X;
@property (weak, nonatomic) IBOutlet UIButton *shiNeiBtn;
@property (weak, nonatomic) IBOutlet UIButton *kuaChengBtn;
@property (weak, nonatomic) IBOutlet UILabel *goAddressLable;

@property (weak, nonatomic) IBOutlet UILabel *Myaddresslabel;
@end


@implementation LYQContentView

-(void)awakeFromNib{
    
    [super awakeFromNib];
    [self setUpView:self.oneView];
    [self setUpView:self.twoView];
    [self setUpView:self.thereView];
    
   
    
    [self.kuaChengBtn setTitleColor:mainColor forState:UIControlStateSelected];
    [self.shiNeiBtn setTitleColor:mainColor forState:UIControlStateSelected];

    [self.kuaChengBtn setTitleColor:disSeleColor forState:UIControlStateNormal];
    [self.shiNeiBtn setTitleColor:disSeleColor forState:UIControlStateNormal];
    
    [self.shiNeiBtn setSelected:YES];
    
    self.Myaddresslabel.userInteractionEnabled = YES;
    
    UIGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeLabelClick:)];

    [self.Myaddresslabel addGestureRecognizer:tap];
    
        UIGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goLabelClick:)];
    
    self.goAddressLable.userInteractionEnabled = YES;
    [self.goAddressLable addGestureRecognizer:tap1];
    
    

}

-(void)changeLabelClick:(UILabel *)addressLabel{
    
    if ([self.delegate respondsToSelector:@selector(contentView:changeAddressLabelClick:)]) {
        [self.delegate contentView:self changeAddressLabelClick:self.Myaddresslabel];
    }
    
}

-(void)goLabelClick:(UILabel *)goAddressLabel{
    
    if ([self.delegate respondsToSelector:@selector(contentView:goAddressLabelClick:)]) {
        [self.delegate contentView:self goAddressLabelClick:self.goAddressLable];
    }
    
}


-(void)setUpView:(UIView *)view{
    
    view.backgroundColor = [UIColor whiteColor];
    view.layer.shadowColor = [UIColor colorWithHexString:@"#d1d1d1"].CGColor;
    view.layer.shadowOffset = CGSizeMake(2, 3);
    view.layer.shadowOpacity = 0.75;
    view.layer.shadowRadius = 3;
    
   // view.layer.borderWidth = 1;
   // view.layer.borderColor = [UIColor grayColor].CGColor;
    
}

+(LYQContentView *)contentView{
    
    return [self xmg_viewFromXib];
    
}

-(void)setAddress:(NSString *)address{
    
    _address = address;
    
    self.Myaddresslabel.text = address;
    
}

- (IBAction)shiNeiClick:(UIButton *)sender {
    [self.kuaChengBtn setSelected:NO];
    [self.shiNeiBtn setSelected:YES];
    [UIView animateWithDuration:0.5 animations:^{
        
        if (self.inderVIew_X.constant > sender.xmg_width) {
            self.inderVIew_X.constant  =  self.inderVIew_X.constant - sender.xmg_width;
            [self layoutIfNeeded];
        }
        
    }];
    
}
- (IBAction)kuaChengClick:(UIButton *)sender {

    [self.kuaChengBtn setSelected:YES];
    [self.shiNeiBtn setSelected:NO];
    
    [UIView animateWithDuration:0.5 animations:^{
        
        if (self.inderVIew_X.constant < sender.xmg_width) {
            
            self.inderVIew_X.constant  =  self.inderVIew_X.constant + sender.xmg_width;
            [self layoutIfNeeded];
        }
        
    }];

}
@end
