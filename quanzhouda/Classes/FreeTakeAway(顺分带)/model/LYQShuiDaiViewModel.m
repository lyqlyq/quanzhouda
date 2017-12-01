//
//  LYQShuiDaiViewModel.m
//  quanzhouda
//
//  Created by pro on 2017/11/27.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQShuiDaiViewModel.h"
#import "LYQShuiDaiModel.h"

@implementation LYQShuiDaiViewModel



-(NSArray *)iconNames{
    
    NSArray *i = @[@"timeImage",@"timeImage",@"leixing",@"zongliang"];
    
    
    return i;
}

-(NSArray *)names{
    NSArray *name = @[@"出发时间",@"预计到达时间",@"可载物品类型",@"可载物品重量"];
    
    
    return name;
    
}

@end
