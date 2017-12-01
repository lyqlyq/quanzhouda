

//
//  LYQMeHeaderView.m
//  quanzhouda
//
//  Created by pro on 2017/11/22.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQMeHeaderView.h"

@interface LYQMeHeaderView()
@property (weak, nonatomic) IBOutlet UIButton *headerBtn;

@end;
@implementation LYQMeHeaderView


-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    self.headerBtn.layer.cornerRadius = self.headerBtn.xmg_width * 0.5;
    self.headerBtn.layer.masksToBounds = YES;
    self.headerBtn.layer.borderWidth = 1.0f;
    self.headerBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    
    
}

@end
