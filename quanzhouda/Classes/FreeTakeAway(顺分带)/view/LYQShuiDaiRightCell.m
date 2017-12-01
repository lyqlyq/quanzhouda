//
//  LYQShuiDaiRightCell.m
//  quanzhouda
//
//  Created by pro on 2017/11/28.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQShuiDaiRightCell.h"

@interface LYQShuiDaiRightCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detialLabel;
@property (weak, nonatomic) IBOutlet UIImageView *leftImageV;

@end

@implementation LYQShuiDaiRightCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.leftImageV.hidden = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setModel:(LYQShuiDaiViewModel *)model{
    _model = model;
    
    self.iconImageV.image = [UIImage imageNamed:model.iconImageName];
    self.nameLabel.text = model.nameStr;
    self.detialLabel.text= model.inderStr;
    self.leftImageV.hidden = !model.isShowLeftImage;
    
}

+(LYQShuiDaiRightCell *)ShuiDaiRightCellWithTab:(UITableView *)tab{
    
    static NSString *cellID = @"CellID";
    LYQShuiDaiRightCell *cell = [tab dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [self xmg_viewFromXib];
    }
    
    return cell;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
