//
//  NSDate+Helper.m
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "NSDate+Helper.h"

@implementation NSDate (Helper)
- (NSInteger)year {
    return [[[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:self] year];
}

- (NSInteger)month {
    return [[[NSCalendar currentCalendar] components:NSMonthCalendarUnit fromDate:self] month];
}

- (NSInteger)day {
    return [[[NSCalendar currentCalendar] components:NSDayCalendarUnit fromDate:self] day];
}

- (NSInteger)hour {
    return [[[NSCalendar currentCalendar] components:NSHourCalendarUnit fromDate:self] hour];
}

- (NSInteger)minute {
    return [[[NSCalendar currentCalendar] components:NSMinuteCalendarUnit fromDate:self] minute];
}

- (NSInteger)second {
    return [[[NSCalendar currentCalendar] components:NSSecondCalendarUnit fromDate:self] second];
}

- (NSInteger)week {
    return [[[NSCalendar currentCalendar] components:NSWeekCalendarUnit fromDate:self] week];
}

- (NSInteger)weekday {
    return [[[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:self] weekday];
}

- (NSInteger)weekdayOrdinal {
    return [[[NSCalendar currentCalendar] components:NSWeekdayOrdinalCalendarUnit fromDate:self] weekdayOrdinal];
}

- (NSInteger)weekOfMonth {
    return [[[NSCalendar currentCalendar] components:NSWeekOfMonthCalendarUnit fromDate:self] weekOfMonth];
}

- (NSInteger)weekOfYear {
    return [[[NSCalendar currentCalendar] components:NSWeekOfYearCalendarUnit fromDate:self] weekOfYear];
}

- (NSInteger)yearForWeekOfYear {
    return [[[NSCalendar currentCalendar] components:NSYearForWeekOfYearCalendarUnit fromDate:self] yearForWeekOfYear];
}

- (NSInteger)quarter {
    return [[[NSCalendar currentCalendar] components:NSQuarterCalendarUnit fromDate:self] quarter];
}

/*
 * This guy can be a little unreliable and produce unexpected results,
 * you're better off using daysAgoAgainstMidnight
 */
- (NSUInteger)daysAgo {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSDayCalendarUnit)
											   fromDate:self
												 toDate:[NSDate date]
												options:0];
	return [components day];
}

- (NSUInteger)daysAgoAgainstMidnight {
	// get a midnight version of ourself:
	NSDateFormatter *mdf = [[NSDateFormatter alloc] init];
	[mdf setDateFormat:@"yyyy-MM-dd"];
	NSDate *midnight = [mdf dateFromString:[mdf stringFromDate:self]];
	
	return (int)[midnight timeIntervalSinceNow] / (60*60*24) *-1;
}

- (NSString *)stringDaysAgo {
	return [self stringDaysAgoAgainstMidnight:YES];
}

- (NSString *)stringDaysAgoAgainstMidnight:(BOOL)flag {
	NSUInteger daysAgo = (flag) ? [self daysAgoAgainstMidnight] : [self daysAgo];
	NSString *text = nil;
	switch (daysAgo) {
		case 0:
			text = @"Today";
			break;
		case 1:
			text = @"Yesterday";
			break;
		default:
			text = [NSString stringWithFormat:@"%d days ago", daysAgo];
	}
	return text;
}



+ (NSDate *)dateFromString:(NSString *)string {
	return [NSDate dateFromString:string withFormat:[NSDate dbFormatString]];
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
	NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
	[inputFormatter setDateFormat:format];
	NSDate *date = [inputFormatter dateFromString:string];
	return date;
}

+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed alwaysDisplayTime:(BOOL)displayTime {
    /*
	 * if the date is in today, display 12-hour time with meridian,
	 * if it is within the last 7 days, display weekday name (Friday)
	 * if within the calendar year, display as Jan 23
	 * else display as Nov 11, 2008
	 */
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *displayFormatter = [[NSDateFormatter alloc] init];
    
	NSDate *today = [NSDate date];
    NSDateComponents *offsetComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
													 fromDate:today];
	
	NSDate *midnight = [calendar dateFromComponents:offsetComponents];
	NSString *displayString = nil;
	
	// comparing against midnight
    NSComparisonResult midnight_result = [date compare:midnight];
	if (midnight_result == NSOrderedDescending) {
		if (prefixed) {
			[displayFormatter setDateFormat:@"'at' h:mm a"]; // at 11:30 am
		} else {
			[displayFormatter setDateFormat:@"h:mm a"]; // 11:30 am
		}
	} else {
		// check if date is within last 7 days
		NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
		[componentsToSubtract setDay:-7];
		NSDate *lastweek = [calendar dateByAddingComponents:componentsToSubtract toDate:today options:0];
        NSComparisonResult lastweek_result = [date compare:lastweek];
		if (lastweek_result == NSOrderedDescending) {
            if (displayTime) {
                [displayFormatter setDateFormat:@"EEEE h:mm a"];
            } else {
                [displayFormatter setDateFormat:@"EEEE"]; // Tuesday
            }
		} else {
			// check if same calendar year
			NSInteger thisYear = [offsetComponents year];
			
			NSDateComponents *dateComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
														   fromDate:date];
			NSInteger thatYear = [dateComponents year];
			if (thatYear >= thisYear) {
                if (displayTime) {
                    [displayFormatter setDateFormat:@"MMM d h:mm a"];
                }
                else {
                    [displayFormatter setDateFormat:@"MMM d"];
                }
			} else {
                if (displayTime) {
                    [displayFormatter setDateFormat:@"MMM d, yyyy h:mm a"];
                }
                else {
                    [displayFormatter setDateFormat:@"MMM d, yyyy"];
                }
			}
		}
		if (prefixed) {
			NSString *dateFormat = [displayFormatter dateFormat];
			NSString *prefix = @"'on' ";
			[displayFormatter setDateFormat:[prefix stringByAppendingString:dateFormat]];
		}
	}
	
	// use display formatter to return formatted date string
	displayString = [displayFormatter stringFromDate:date];
    
    
	return displayString;
}

+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed {
	return [[self class] stringForDisplayFromDate:date prefixed:prefixed alwaysDisplayTime:NO];
}

+ (NSString *)stringForDisplayFromDate:(NSDate *)date {
	return [self stringForDisplayFromDate:date prefixed:NO];
}

- (NSString *)stringWithFormat:(NSString *)format {
	NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
	[outputFormatter setDateFormat:format];
	NSString *timestamp_str = [outputFormatter stringFromDate:self];
	return timestamp_str;
}

- (NSString *)string {
	return [self stringWithFormat:[NSDate dbFormatString]];
}

- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle {
	NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
	[outputFormatter setDateStyle:dateStyle];
	[outputFormatter setTimeStyle:timeStyle];
	NSString *outputString = [outputFormatter stringFromDate:self];
	return outputString;
}

- (NSDate *)beginningOfWeek {
	// largely borrowed from "Date and Time Programming Guide for Cocoa"
	// we'll use the default calendar and hope for the best
	NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *beginningOfWeek = nil;
	BOOL ok = [calendar rangeOfUnit:NSWeekCalendarUnit startDate:&beginningOfWeek
						   interval:NULL forDate:self];
	if (ok) {
		return beginningOfWeek;
	}
	
	// couldn't calc via range, so try to grab Sunday, assuming gregorian style
	// Get the weekday component of the current date
	NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
	
	/*
	 Create a date components to represent the number of days to subtract from the current date.
	 The weekday value for Sunday in the Gregorian calendar is 1, so subtract 1 from the number of days to subtract from the date in question.  (If today's Sunday, subtract 0 days.)
	 */
	NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
	[componentsToSubtract setDay: 0 - ([weekdayComponents weekday] - 1)];
	beginningOfWeek = nil;
	beginningOfWeek = [calendar dateByAddingComponents:componentsToSubtract toDate:self options:0];
	
	//normalize to midnight, extract the year, month, and day components and create a new date from those components.
	NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
											   fromDate:beginningOfWeek];
	return [calendar dateFromComponents:components];
}

- (NSDate *)beginningOfDay {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // Get the weekday component of the current date
	NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
											   fromDate:self];
	return [calendar dateFromComponents:components];
}

- (NSDate *)endOfWeek {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // Get the weekday component of the current date
	NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
	NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
	// to get the end of week for a particular date, add (7 - weekday) days
	[componentsToAdd setDay:(7 - [weekdayComponents weekday])];
	NSDate *endOfWeek = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
	
	return endOfWeek;
}

+ (NSString *)dateFormatString {
	return @"yyyy-MM-dd";
}

+ (NSString *)timeFormatString {
	return @"HH:mm:ss";
}

+ (NSString *)timestampFormatString {
	return @"yyyy-MM-dd HH:mm:ss";
}

// preserving for compatibility
+ (NSString *)dbFormatString {
	return [NSDate timestampFormatString];
}

- (NSDate *)yesterday {
	NSDate *date = [NSDate date];
	NSDateComponents *components = [[NSDateComponents alloc] init];
	[components setDay:-1];
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	return [gregorian dateByAddingComponents:components toDate:date options:0];
}

- (NSDate *)tomorrow {
	NSDate *date = [NSDate date];
	NSDateComponents *components = [[NSDateComponents alloc] init];
	[components setDay:1];
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	return [gregorian dateByAddingComponents:components toDate:date options:0];
}

///////////////////////////////////////////////////////////

//获取年月日如:19871127.
- (NSString *)getFormatYearMonthDay
{
	NSString *string = [NSString stringWithFormat:@"%d%02d%02d",self.year,self.month,self.day];
	return string;
}


//返回day天后的日期(若day为负数,则为|day|天前的日期)
- (NSDate *)dateAfterDay:(int)day
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	// Get the weekday component of the current date
	// NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
	NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
	// to get the end of week for a particular date, add (7 - weekday) days
	[componentsToAdd setDay:day];
	NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
	
	return dateAfterDay;
}
//month个月后的日期
- (NSDate *)dateafterMonth:(int)month
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
	[componentsToAdd setMonth:month];
	NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
	
	return dateAfterMonth;
}

//返回该月的第一天
- (NSDate *)beginningOfMonth
{
	return [self dateAfterDay:-self.day + 1];
}
//该月的最后一天
- (NSDate *)endOfMonth
{
	return [[[self beginningOfMonth] dateafterMonth:1] dateAfterDay:-1];
}

+ (NSString *)currentTimeBySecond
{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f", a];
    return timeString;
}

+(NSString *)preDate:(NSString *)strDate
{
    if ([strDate length] == 0)
    {
        return nil;
    }
    
    return [[self class] jumpPre:YES rangedays:1 fromdate:strDate];
}

+(NSString *)nextDate:(NSString *)strDate
{
    if ([strDate length] == 0)
    {
        return nil;
    }
    
    return [[self class] jumpPre:NO rangedays:1 fromdate:strDate];
}

+(NSString *)jumpPre:(BOOL)pre rangedays:(NSInteger)days fromdate:(NSString *)strDate
{
    if ([strDate length] == 0)
    {
        return nil;
    }
    
    days = (pre ? (- days) : days);
    
    NSDateFormatter*formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyMMdd"];
    NSDate *locationdate=[formatter dateFromString:strDate];
    NSDate *predate = [NSDate dateWithTimeInterval:days*24*60*60 sinceDate:locationdate];
    NSString *locationString = [formatter stringFromDate:predate];
    return locationString;
}

+(NSDate *)DateWithDateString:(NSString *)strDate formatString:(NSString*)strFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone =  [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat : strFormat];
    NSDate *dateTime = [formatter dateFromString:strDate];
    return dateTime;
}

+(NSString *)DateStringWithDate:(NSDate *)_Date formatString:(NSString*)strFormat
{
    return [_Date stringWithFormat:strFormat];
}
@end
