//
//  LYQContentRightView.m
//  quanzhouda
//
//  Created by pro on 2017/11/22.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQContentRightView.h"

@interface LYQContentRightView()

@property (weak, nonatomic) IBOutlet UILabel *becomeCheLabel;
@property (weak, nonatomic) IBOutlet UILabel *becomeCheLaeblTwo;

@end



@implementation LYQContentRightView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.becomeCheLaeblTwo.userInteractionEnabled = YES;
    self.becomeCheLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(becomeClick)];
      UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(becomeClick)];
    [self.becomeCheLabel addGestureRecognizer:tap];
    [self.becomeCheLaeblTwo addGestureRecognizer:tap1];
    
}
-(void)becomeClick{

    if (self.block) {
        self.block();
    }
}

+(LYQContentRightView *)rightView{
    
    return [self xmg_viewFromXib];
}



@end
