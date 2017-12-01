//
//  LYQShuiDaiModel.h
//  quanzhouda
//
//  Created by pro on 2017/11/27.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYQShuiDaiModel : NSObject

@property (nonatomic ,copy) NSString *type;

@property (nonatomic ,copy) NSString *startAddress;

@property (nonatomic ,copy) NSString *endAddress;

@property (nonatomic ,copy) NSString *time;

@property (nonatomic ,strong) NSArray *infos;

@property (nonatomic ,strong) NSArray *getArrType;

@property (nonatomic ,copy) NSString *remarks;

@property (nonatomic ,strong) NSMutableArray *infosFrames;

@property (nonatomic ,assign) CGFloat cellHeight;



@end
