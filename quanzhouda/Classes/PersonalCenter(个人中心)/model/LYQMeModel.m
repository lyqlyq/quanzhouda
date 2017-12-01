



//
//  LYQMeModel.m
//  quanzhouda
//
//  Created by pro on 2017/11/22.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQMeModel.h"

@implementation LYQMeModel


-(NSMutableArray *)allModelArr{
    
    NSMutableArray *models = [NSMutableArray array];
    NSArray *leftTextArr = @[@"我的行程",@"我的钱包",@"我的订单",@"联系客服",@"设置"];
    NSArray *leftImageArr = @[@"xincheng",@"qianbao",@"dingdan",@"kefu",@"shezhi"];
    
    for(NSInteger i = 0 ; i < leftTextArr.count ; i ++){
        
        LYQMeModel *model = [[LYQMeModel alloc] init];
        
        model.leftText = leftTextArr[i];
        model.leftImageName = leftImageArr[i];
        [models addObject:model];
        
    }
    return models;
    
    
}


@end
