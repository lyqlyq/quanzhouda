//
//  LYQShuiDaiViewModel.h
//  quanzhouda
//
//  Created by pro on 2017/11/27.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LYQShuiDaiViewModel : NSObject


@property (nonatomic ,copy) NSString *iconImageName;

@property (nonatomic ,copy) NSString *nameStr;

@property (nonatomic ,copy) NSString *inderStr;

@property (nonatomic ,assign) BOOL isShowLeftImage;


@property (nonatomic ,strong) NSArray *iconNames;

@property (nonatomic ,strong) NSArray *names;

@property (nonatomic ,strong) NSData *startData;

@property (nonatomic ,strong) NSData *endData;


// 可带的类型
@property (nonatomic ,strong) NSMutableArray *types;


@end
