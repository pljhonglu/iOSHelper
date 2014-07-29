//
//  NSDate+Helper.h
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 G:    公元时代，例如AD公元
 yy:   年的后2位
 yyyy: 完整年
 MM:   月，显示为1-12
 MMM:  月，显示为英文月份简写,如 Jan
 MMMM: 月，显示为英文月份全称，如 Janualy
 dd:   日，2位数表示，如02
 d:    日，1-2位显示，如 2
 EEE:  简写星期几，如Sun
 EEEE: 全写星期几，如Sunday
 aa:   上下午，AM/PM
 H:    时，24小时制，0-23
 K:    时，12小时制，0-11
 m:    分，1-2位
 mm:   分，2位
 s:    秒，1-2位
 ss:   秒，2位
 S:    毫秒
 Z:    GMT
 */
@interface NSDate (Helper)
@property (nonatomic, readonly) NSInteger year;
@property (nonatomic, readonly) NSInteger month;
@property (nonatomic, readonly) NSInteger week;
@property (nonatomic, readonly) NSInteger day;
@property (nonatomic, readonly) NSInteger hour;
@property (nonatomic, readonly) NSInteger minute;
@property (nonatomic, readonly) NSInteger second;

@property (nonatomic, readonly) NSInteger weekday;//返回一周的第几天(周末为第一天)
@property (nonatomic, readonly) NSInteger weekdayOrdinal;//该月的周序数，从该月第一天的日期开始计算，第n个七天为n
@property (nonatomic, readonly) NSInteger weekOfMonth;//该日期是该月的第几周
@property (nonatomic, readonly) NSInteger weekOfYear;//该日期是该年的第几周
@property (nonatomic, readonly) NSInteger yearForWeekOfYear;//年
@property (nonatomic, readonly) NSInteger quarter;//季度


- (NSUInteger)daysAgo;//在当前日期前几天
- (NSUInteger)daysAgoAgainstMidnight;//午夜时间距今几天
- (NSString *)stringDaysAgo;
- (NSString *)stringDaysAgoAgainstMidnight:(BOOL)flag;

- (NSDate *)beginningOfWeek;//返回周日的的开始时间
- (NSDate *)beginningOfDay;//返回当前天的开始时间(零点)
- (NSDate *)endOfWeek;//返回当前周的周末
- (NSDate *)beginningOfMonth;//返回该月的第一天
- (NSDate *)endOfMonth;//该月的最后一天

- (NSDate *)yesterday;
- (NSDate *)tomorrow;

//返回day天后的日期(若day为负数,则为|day|天前的日期)
- (NSDate *)dateAfterDay:(int)day;
//month个月后的日期
- (NSDate *)dateafterMonth:(int)month;
//获取年月日如:19871127
- (NSString *)getFormatYearMonthDay;


//date -> string
- (NSString *)string;//yyyy-MM-dd HH:mm:ss
- (NSString *)stringWithFormat:(NSString *)format;
- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;
/**
 下面这个基本用不上
 @param date
 @return 
 '3:42 AM’      – if the date is after midnight today
 ‘Tuesday’      – if the date is within the last seven days
 ‘Mar 1’        – if the date is within the current calendar year
 ‘Mar 1, 2008’  – else
 */
+ (NSString *)stringForDisplayFromDate:(NSDate *)date;
+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed;
+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed alwaysDisplayTime:(BOOL)displayTime;

//string -> date
+ (NSDate *)dateFromString:(NSString *)string;//yyyy-MM-dd HH:mm:ss
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;


+ (NSString *)dateFormatString;//return yyyy-MM-dd
+ (NSString *)timeFormatString;//return HH:mm:ss
+ (NSString *)timestampFormatString;//return yyyy-MM-dd HH:mm:ss
+ (NSString *)dbFormatString;//数据库的时间格式|return yyyy-MM-dd HH:mm:ss

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
