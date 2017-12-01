



//
//  LYQAddressCell.m
//  quanzhouda
//
//  Created by pro on 2017/11/29.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQAddressCell.h"

#import "LYQAddressModel.h"

@interface LYQAddressCell()
@property (weak, nonatomic) IBOutlet UILabel *nameStrLabel;
@property (weak, nonatomic) IBOutlet UILabel *diteLabel;

@end

@implementation LYQAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(LYQAddressModel *)model{
    _model = model;
    
    self.nameStrLabel.text = model.name;
    
    
    NSArray *address = [model.address componentsSeparatedByString:@";"];
    
    NSString *str = [address firstObject];
    
    self.diteLabel.text = [NSString stringWithFormat:@"%@%@",model.district,str];
    
}

+(LYQAddressCell *)addressCellWithTab:(UITableView *)tab
{
    
    static NSString *CellID = @"cellID";
    
    LYQAddressCell *cell = [tab dequeueReusableCellWithIdentifier:CellID];
    if (cell == nil) {
        cell = [LYQAddressCell xmg_viewFromXib];
    }
    
    
    return cell;
    
    
}


@end
