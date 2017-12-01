//
//  LYQTimeTool.h
//  quanzhouda
//
//  Created by pro on 2017/11/28.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYQTimeTool : NSObject

+(NSMutableArray *)getAllHours;
+(NSMutableArray *)getAllDays;
+(NSMutableArray *)getMins;

/**获取当前是多少小时*/
+(NSInteger)getCurrentHour;
/**获取当前小时以后的小时 -- */
+(NSMutableArray *)getCurrentAfterHours;

/**获取当前是多少分钟*/
+(NSInteger)getCurrentMin;
/**获取当前剩下的分钟*/
+(NSMutableArray *)getCurrentAfterMins;

+(NSString *)getDataString:(NSString *)day hours:(NSString *)hours min:(NSString *)min;

@end
