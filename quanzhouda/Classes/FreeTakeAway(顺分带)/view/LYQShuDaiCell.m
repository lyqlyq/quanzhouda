//
//  LYQShuDaiCell.m
//  quanzhouda
//
//  Created by pro on 2017/11/27.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQShuDaiCell.h"

#import "LYQShuiDaiModel.h"

@interface LYQShuDaiCell ()
@property (weak, nonatomic) IBOutlet UIView *DaiView;
@property (weak, nonatomic) IBOutlet UILabel *startAddressLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dai_const_H;

@property (nonatomic ,strong) UILabel *tepmLabel;

// 提货方式
@property (weak, nonatomic) IBOutlet UIView *tiFangLabel;

// 备注
@property (weak, nonatomic) IBOutlet UIView *reakView;
@property (weak, nonatomic) IBOutlet UILabel *typeOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeTwoLabel;
@property (weak, nonatomic) IBOutlet UILabel *reankLabel;

@end

@implementation LYQShuDaiCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.typeOneLabel drawGrayLine];
    [self.typeTwoLabel drawGrayLine];
    
    

}

-(void)setModel:(LYQShuiDaiModel *)model{
    _model = model;
    
    CGFloat marge_XY = 9;
    
    for (NSInteger i = 0 ; i < model.infos.count; i ++) {

        NSValue  *v =  model.infosFrames[i];
        UILabel *la = [[UILabel alloc] initWithFrame:v.CGRectValue];
        la.font = [UIFont systemFontOfSize:12];
        la.text = model.infos[i];
        la.textAlignment = NSTextAlignmentCenter;
        [la drawGrayLine];
        self.tepmLabel = la;
        [self.DaiView addSubview:la];
    }
    
    self.reankLabel.text = model.remarks;
    
    self.dai_const_H.constant = CGRectGetMaxY(self.tepmLabel.frame) + marge_XY;
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.reakView drawGrayLineRadius];
    
    self.reakView.xmg_height += 10;
    
}

-(CGSize)getStrW:(NSString *)str{
    
    return   [str boundingRectWithSize:CGSizeMake(MAXFLOAT, 12) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;;
}

@end
