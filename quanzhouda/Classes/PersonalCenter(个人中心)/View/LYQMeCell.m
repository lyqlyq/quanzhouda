//
//  LYQMeCell.m
//  quanzhouda
//
//  Created by pro on 2017/11/22.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQMeCell.h"


@interface LYQMeCell ()

@property (nonatomic ,strong) UIImageView *imageV;
@property (nonatomic ,strong) UILabel *leftLabel;
@property (nonatomic ,strong) UIImageView *rightImage;

@end

@implementation LYQMeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.imageV = [[UIImageView alloc] init];
        self.leftLabel = [[UILabel alloc] init];
        self.rightImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left"]];
        self.leftLabel.textColor = [UIColor colorWithHexString:@"#4a4a4a"];
        self.leftLabel.font = [UIFont systemFontOfSize:16];
        
        
        [self addSubview:self.imageV];
        [self addSubview:self.leftLabel];
        [self addSubview:self.rightImage];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        
        
    }
    
    return self;
    
}

-(void)setModel:(LYQMeModel *)model{
    _model = model;
    
    self.imageV.image = [UIImage imageNamed:model.leftImageName];
    self.leftLabel.text = model.leftText;

    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat imageVX = 15;
    CGFloat imageVY = 12;
    CGFloat imageVW = 17;
    CGFloat imageVH = 18;
    
    self.imageV.xmg_x = imageVX;
    self.imageV.xmg_y = imageVY;
    self.imageV.xmg_width = imageVW;
    self.imageV.xmg_height = imageVH;
    
    CGFloat leftLabel_X = CGRectGetMaxX(self.imageV.frame) + 15;
    CGFloat leftLabel_Y = 0;
    CGFloat leftLabel_W = 70;
    CGFloat leftLabel_H = self.xmg_height;

    self.leftLabel.frame = CGRectMake(leftLabel_X, leftLabel_Y, leftLabel_W, leftLabel_H);
    CGFloat rightImageW = 6;
    CGFloat rightImageH = 10;
    CGFloat rightImageX = [UIScreen mainScreen].bounds.size.width - rightImageW - 10;
    CGFloat rightImageY = 16;

    
    self.rightImage.frame = CGRectMake(rightImageX, rightImageY, rightImageW, rightImageH);

    
}

@end
