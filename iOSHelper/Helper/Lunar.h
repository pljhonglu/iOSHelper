//
//  Lunar.h
//  vik_learning_ios
//
//  Created by viktyz on 13-1-25.
//
//

#import <Foundation/Foundation.h>

@interface Lunar : NSObject

/**
 * 获取农历节气
 * @param iYear 公历年
 * @param iMonth 公历月
 * @param iDay 公历日
 * @returns 农历节气
 */
+(NSString *)LunarSpecialDate:(int)iYear Month:(int)iMonth  Day:(int)iDay;


/**
 * 获取农历节日
 * @param date 公历日期
 * @returns 农历节日
 */
+(NSString *)LunarHoliDayDate:(NSDate *)date;


/**
 * 获取农历日期
 * @param date 公历日期
 * @returns 农历节日
 */
+(NSString *)ChineseCalendarWithDate:(NSDate *)date;


/**
 * 获取农历月份
 * @param date 公历日期
 * @returns 农历月份
 */
+(NSString *)ChineseMonthWithDate:(NSDate *)date;


@end
