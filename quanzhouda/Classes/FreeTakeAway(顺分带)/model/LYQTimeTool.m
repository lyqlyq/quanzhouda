//
//  LYQTimeTool.m
//  quanzhouda
//
//  Created by pro on 2017/11/28.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQTimeTool.h"

@implementation LYQTimeTool


-(instancetype)init{
    
    if (self = [super init]) {
      
    }
    return self;
}
+(NSMutableArray *)getAllHours{
    NSMutableArray *hours = [NSMutableArray array];
    for (NSInteger  i = 0 ; i < 24; i ++) {
        [hours addObject:[NSString stringWithFormat:@"%ld 点",i]];
    }
    return hours;

}
+(NSMutableArray *)getAllDays{
    NSMutableArray *allDays = [NSMutableArray array];
    [allDays addObject:@"今天"];
    [allDays addObject:@"明天"];
    [allDays addObject:@"后天"];
    NSInteger dis = 7; //前后的天数
    for (NSInteger i = 0 ; i < dis; i ++) {
        NSDate*  nowDate = [NSDate date];
        NSDate*  theDate;
        NSTimeInterval  oneDay = 24*60*60*i;  //1天的长度
        theDate = [nowDate initWithTimeIntervalSinceNow: + oneDay];
        NSString *week =  [self weekdayStringFromDate:theDate];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM月dd日"];
        NSString * currentDateStr =  [NSString stringWithFormat:@"%@ %@",[dateFormatter stringFromDate:theDate],week];
        if (i > 2) {
            [allDays addObject:currentDateStr];
        }
    }
    return allDays;

}
+(NSMutableArray *)getMins{
    NSMutableArray *mins = [NSMutableArray array];
    
    for (NSInteger  i = 0 ; i < 60;  i ++) {
        
        if (i % 5 == 0) {
            [mins addObject:[NSString stringWithFormat:@"%ld 分",i]];
        }
    
    }

    return mins;
}



// 判断当前周几
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
        
        NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
        
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        
        NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
        
        [calendar setTimeZone: timeZone];
        
        NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
        
        NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
        
        return [weekdays objectAtIndex:theComponents.weekday];
    
}


+(NSInteger)getCurrentHour{
    
    
    NSDate *  senddate=[NSDate date];
    NSCalendar  * cal=[NSCalendar  currentCalendar];
    NSUInteger  unitFlags=NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear|NSCalendarUnitHour|NSCalendarUnitMinute;
    NSDateComponents * conponent= [cal components:unitFlags fromDate:senddate];
    NSInteger hour = [conponent hour];
    return hour;
    
}


+(NSMutableArray *)getCurrentAfterHours{
    
   
    NSMutableArray *afterTimesArr = [self getAllHours];
    NSInteger  currentHour = [self getCurrentHour];
    
    NSString *obj = [NSString stringWithFormat:@"%ld 点",currentHour];
    NSInteger index = [afterTimesArr indexOfObject:obj];
    
    [afterTimesArr removeObjectsInRange:NSMakeRange(0, index)];
    
    
    return afterTimesArr;
}


+(NSInteger)getCurrentMin{
    NSDate *  senddate=[NSDate date];
    NSCalendar  * cal=[NSCalendar  currentCalendar];
    NSUInteger  unitFlags=NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear|NSCalendarUnitHour|NSCalendarUnitMinute;
    NSDateComponents * conponent= [cal components:unitFlags fromDate:senddate];
    NSInteger minute = [conponent minute];
    return minute;
    
}

+(NSMutableArray *)getCurrentAfterMins{
    
    NSMutableArray *mins = [self getMins];
    
    NSInteger currentMin = [self getCurrentMin] / 5 + 1;

    [mins removeObjectsInRange:NSMakeRange(0, currentMin)];
   
    return mins;
}

+(NSString *)getDataString:(NSString *)day hours:(NSString *)hours min:(NSString *)min{
    
    if ([day isEqualToString:@"今天"]) {
        NSString *today = [self getCurrentTime];
        return [self getTimeForTodayForThere:today hour:hours min:min];
        

    }
    
    if ([day isEqualToString:@"明天"]) {
        NSString *today = [self GetTomorrowDay];
        return [self getTimeForTodayForThere:today hour:hours min:min];
    }
    
    if ([day isEqualToString:@"后天"]) {
        NSString *today = [self GetAffterDay];
        return [self getTimeForTodayForThere:today hour:hours min:min];
    }
    // 12月5日
    
    NSString *year = [self getCurrentYear];
    
    NSArray *dayAndHourArr = [day componentsSeparatedByString:@"月"];
    NSString *lastHour = [dayAndHourArr lastObject];
    NSString *myMon =  [[day componentsSeparatedByString:@"月"] firstObject];
    NSString *myDay = [[lastHour componentsSeparatedByString:@"日"] firstObject];
    
    NSString *hour = [[hours componentsSeparatedByString:@" "] firstObject];
    NSString *mi = [[min componentsSeparatedByString:@" "] firstObject];
    
    
    NSString *dataStr = [NSString stringWithFormat:@"%@-%@-%@ %02d:%02d",year,myMon,myDay,hour.integerValue,mi.integerValue];
    
    NSDate *myDate = [self dateFromString:dataStr];
    
    NSString *strTime = [NSString stringWithFormat:@"%f",[myDate timeIntervalSince1970]];
    
    return strTime;
    
}
// 今天 ，明天  ， 后天
+ (NSString *)getTimeForTodayForThere:(NSString *)today hour:(NSString *)h min:(NSString *)m{
    NSString *hour = [[h componentsSeparatedByString:@" "] firstObject];
    NSString *mi = [[m componentsSeparatedByString:@" "] firstObject];
    NSString *timeStr = [NSString stringWithFormat:@"%@ %02d:%02d",today,hour.integerValue,mi.integerValue];
    NSDate *timeDate = [self dateFromString:timeStr];
    NSString *strTime = [NSString stringWithFormat:@"%f",[timeDate timeIntervalSince1970]];
    return strTime;
    
}


// 获取当前的年份
+ (NSString *)getCurrentYear {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;
}

//获取当地时间
+ (NSString *)getCurrentTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;
}



//将字符串转成NSDate类型
+ (NSDate *)dateFromString:(NSString *)dateString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}
//返回明天的时间
+ (NSString *)GetTomorrowDay{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    [components setDay:([components day]+1)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    [dateday setDateFormat:@"yyyy-MM-dd"];
    return [dateday stringFromDate:beginningOfWeek];
}

//返回后天的时间
+ (NSString *)GetAffterDay{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    [components setDay:([components day]+2)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    [dateday setDateFormat:@"yyyy-MM-dd"];
    return [dateday stringFromDate:beginningOfWeek];
}



@end
