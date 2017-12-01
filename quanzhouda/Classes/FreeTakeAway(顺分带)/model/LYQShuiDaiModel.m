//
//  LYQShuiDaiModel.m
//  quanzhouda
//
//  Created by pro on 2017/11/27.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQShuiDaiModel.h"

@interface LYQShuiDaiModel ()

@property (nonatomic ,assign) CGRect laFrame;

@end

@implementation LYQShuiDaiModel


-(instancetype)init{
    
    if (self = [super init]) {
        
        self.infos = @[@"24寸香包一个",@"重20公斤",@"贵重",@"24寸香包一个",@"24寸香包一个",@"1111111111124寸香包一个"];
        self.remarks = @"不带宠物，脏物，及易碎物品不带宠物，脏物，及易碎物品不带宠物，脏物，及易碎物品不带宠物，脏物，及易碎物品不带宠物，脏物，及易碎物品不带宠物，脏物，及易碎物品不带宠物，脏物，及易碎物品不带宠物，脏物，及易碎物品不带宠物，脏物，及易碎物品不带宠物，脏物，及易碎物品不带宠物，脏物，及易碎物品不带宠物，脏物，及易碎物品不带宠物，脏物，及易碎物品不带宠物，脏物，及易碎物品不带宠物，脏物，及易碎物品不带宠物，脏物，及易碎物品不带宠物，脏物，及易碎物品不带宠物，脏物，及易碎物品不带宠物，脏物，及易碎物品";
    }
    
    return self;
    
}

-(NSMutableArray *)infosFrames{
    
    CGFloat la_H = 23;
    CGFloat la_X = 0;
    CGFloat la_Y = 0;
    CGFloat marge_XY = 9;
    _infosFrames = [NSMutableArray array];
    
    for (NSInteger i = 0 ; i < self.infos.count; i ++) {
        CGFloat la_W = [self getStrW:self.infos[i]].width + 10;
        if (i > 0) {
            la_X = CGRectGetMaxX(self.laFrame) + marge_XY;
            if ((la_X + la_W) > screen_W) {
                la_X = 0;
                la_Y = la_Y + marge_XY + la_H;
            }
        }
        CGRect frame = CGRectMake(la_X, la_Y, la_W, la_H);
        
        self.laFrame = frame;
        
        [_infosFrames addObject:[NSValue valueWithCGRect:frame]];
    }
    return _infosFrames;
    
}

-(CGFloat)cellHeight{
    
    NSValue *v =  [self.infosFrames lastObject];
    
    CGRect frame = v.CGRectValue;
    
    CGFloat la_h = CGRectGetMaxY(frame) - 23;
    
    CGFloat h = 250.0f;
    
   CGFloat reakH = [self getStrH:self.remarks].height;
    
    
    NSLog(@"%f",reakH);
    
    return la_h + h + reakH;
}

// 算备注的高度
-(CGSize)getStrH:(NSString *)str{
    
    return   [str boundingRectWithSize:CGSizeMake(screen_W - 50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;;
}

-(CGSize)getStrW:(NSString *)str{
    
    return   [str boundingRectWithSize:CGSizeMake(MAXFLOAT, 12) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;;
}



@end
