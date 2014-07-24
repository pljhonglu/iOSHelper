//
//  NSDate+Helper.h
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Helper)
- (NSUInteger)daysAgo;
- (NSUInteger)daysAgoAgainstMidnight;
- (NSString *)stringDaysAgo;
- (NSString *)stringDaysAgoAgainstMidnight:(BOOL)flag;
- (NSUInteger)weekday;

+ (NSDate *)dateFromString:(NSString *)string;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)string;
+ (NSString *)stringFromDate:(NSDate *)date;
+ (NSString *)stringForDisplayFromDate:(NSDate *)date;
+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed;
+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed alwaysDisplayTime:(BOOL)displayTime;

- (NSString *)string;
- (NSString *)stringWithFormat:(NSString *)format;
- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

- (NSDate *)beginningOfWeek;
- (NSDate *)beginningOfDay;
- (NSDate *)endOfWeek;

+ (NSString *)dateFormatString;
+ (NSString *)timeFormatString;
+ (NSString *)timestampFormatString;
+ (NSString *)dbFormatString;


- (NSDate *)yesterday;
- (NSDate *)tomorrow;

//获取年月日如:19871127.
- (NSString *)getFormatYearMonthDay;

//该日期是该年的第几周
- (int )getWeekOfYear;

//返回day天后的日期(若day为负数,则为|day|天前的日期)
- (NSDate *)dateAfterDay:(int)day;

//month个月后的日期
- (NSDate *)dateafterMonth:(int)month;

//获取日
- (NSUInteger)getDay;

//获取月
- (NSUInteger)getMonth;

//获取年
- (NSUInteger)getYear;

//获取小时
- (int )getHour;

//获取分钟
- (int)getMinute;

- (int)getHour:(NSDate *)date;

- (int)getMinute:(NSDate *)date;

//返回该月的第一天
- (NSDate *)beginningOfMonth;
//该月的最后一天
- (NSDate *)endOfMonth;

/**
 获取当前时间戳
 @returns 当前时间戳
 */
+ (NSString *)currentTimeBySecond;


/**
 获取指定日期前一天的日期
 @param strDate 指定日期
 @returns 前一天日期
 */
+(NSString *)preDate:(NSString *)strDate;


/**
 获取指定日期后一天的日期
 @param strDate 指定日期
 @returns 后一天日期
 */
+(NSString *)nextDate:(NSString *)strDate;


/**
 获取指定日期前或者后指定某天的日期
 @param pre 往前为 YES; 往后为 NO
 @param days 跳转日期
 @param strDate 指定日期
 @returns 跳转结构日期
 */
+(NSString *)jumpPre:(BOOL)pre rangedays:(NSInteger)days fromdate:(NSString *)strDate;


/**
 按照字符串和指定格式获取公历日期
 @param strDate 公历日期
 @param strFormat
 @returns 公历日期
 */
+(NSDate *)DateWithDateString:(NSString *)strDate formatString:(NSString*)strFormat;


/**
 按照字符串和指定格式获取公历日期
 （更多相关方法参考 NSDate+Helper.h 文件）
 @param _Date 公历日期
 @param strFormat 指定格式,如：@"yyyy-MM-dd HH:mm:ss"
 @returns 字符串型日期
 */
+(NSString *)DateStringWithDate:(NSDate *)_Date formatString:(NSString*)strFormat;

@end
