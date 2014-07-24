//
//  Tools.m
//  vik_learning_ios
//
//  Created by viktyz on 13-2-6.
//  Copyright (c) 2013年 neu. All rights reserved.
//

#import "Tools.h"

#import "NSDate+Helper.h"
#import "UIDevice+IdentifierAddition.h"

#import "AHReach.h"

@implementation Tools

#pragma mark -
#pragma mark file system
+ (NSNumber*) totalDiskSpace
{
	NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
	return [fattributes objectForKey:NSFileSystemSize];
}


+ (NSNumber*) freeDiskSpace
{
    
	NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
	return [fattributes objectForKey:NSFileSystemFreeSize];
}

//Private document
+ (NSString *)privateDocsDirPath 
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:@"PrivateDocuments"];
    
    NSError *error = nil;
    [[NSFileManager defaultManager] createDirectoryAtPath:documentsDirectory
                              withIntermediateDirectories:YES
                                               attributes:nil
                                                    error:&error];
    
    return documentsDirectory;
}

+ (NSString *)groupDocsDirPath:(NSString *)_groupName {
    
    if ([_groupName length] == 0) 
    {
        return nil;
    }
    
    NSString *documentsDirectory = [[self class] privateDocsDirPath];
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:_groupName];
    
    NSError *error = nil;
    [[NSFileManager defaultManager] createDirectoryAtPath:documentsDirectory
                              withIntermediateDirectories:YES
                                               attributes:nil
                                                    error:&error];
    
    return documentsDirectory;
}

//获取完整路径
+ (NSString *)fileFullPathWithName:(NSString *)_fileName inGroup:(NSString *)_groupName{
    
    if ([_fileName length] == 0
        ||[_groupName length] == 0) 
    {
        return nil;
    }
    
    NSString *documentsDirectory = [[self class] groupDocsDirPath:_groupName];
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:_fileName];
    
    return fullPath;
}

//检查文件是否存在
+ (BOOL)isFileExist:(NSString *)_filename inGroup:(NSString *)_groupName
{
    if ([_filename length] == 0
        ||[_groupName length] == 0) 
    {
        return NO;
    }
    
    NSString *strPath = [[self class] fileFullPathWithName:_filename inGroup:_groupName];
    return [[NSFileManager defaultManager] fileExistsAtPath:strPath];
}

//删除文件
+ (BOOL)deleteFile:(NSString *)_filename inGroup:(NSString *)_groupName
{
    if ([_filename length] == 0
        ||[_groupName length] == 0) 
    {
        return NO;
    }
    
    NSString *strPath = [[self class] fileFullPathWithName:_filename inGroup:_groupName];
    return [[NSFileManager defaultManager] removeItemAtPath:strPath error:nil];
}

//删除文件夹
+ (BOOL)deleteGroup:(NSString *)_groupName
{
    if ([_groupName length] == 0) 
    {
        return NO;
    }
    
    NSString *strPath = [[self class] groupDocsDirPath:_groupName];
    return [[NSFileManager defaultManager] removeItemAtPath:strPath error:nil];
}

//User document

//获取完整路径
+ (NSString *)fileFullPathWithName:(NSString *)fileName
{
    if ([fileName length] == 0) 
    {
        return nil;
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    [fileManager changeCurrentDirectoryPath:[documentsDirectory stringByExpandingTildeInPath]];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:fileName];
    
    if (!path){
        [fileManager createFileAtPath:fileName contents:nil attributes:nil];
    }
    
    return path;
}

//检查文件是否存在
+(BOOL)isFileExist:(NSString *)fileName
{
    if ([fileName length] == 0) 
    {
        return NO;
    }
    
    return [[NSFileManager defaultManager] fileExistsAtPath:
            [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
             stringByAppendingPathComponent:fileName]];
}

//删除文件
+ (BOOL)deleteFile:(NSString*)fileName
{
    if ([fileName length] == 0) 
    {
        return NO;
    }
    
    return [[NSFileManager defaultManager] removeItemAtPath:
            [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
             stringByAppendingPathComponent:fileName] error:nil];
}

#pragma mark -
#pragma mark time method
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

#pragma mark -
#pragma mark Application method

+(BOOL)isFirstOperate:(NSString *)_operationName
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    BOOL  hasRunBefore = [defaults boolForKey:_operationName];
    
    if(!hasRunBefore)
    {
        [defaults setBool:YES forKey:_operationName];
        [defaults synchronize];
        return YES;
    }
    
    return NO;
}

+(void)setStatusBarHidden:(BOOL)_hidden
{
    [[UIApplication sharedApplication] setStatusBarHidden:_hidden withAnimation:UIStatusBarAnimationNone];
}

#pragma mark -
#pragma mark Device method

+(NSString *)SystemName
{
    return [[UIDevice currentDevice] systemName];
}

+(NSString *)SystemVersion
{
    return [[UIDevice currentDevice] systemVersion];
}

+(NSString *)DeviceModel
{
    return [[UIDevice currentDevice] model];
}

+(NSString *)UniqueIdentifier_Hard
{
    return [[UIDevice currentDevice] uniqueDeviceIdentifier];
}

+(NSString *)UniqueIdentifier_Soft
{
    NSString *strUDID = [[[UIDevice currentDevice] uniqueGlobalDeviceIdentifier] uppercaseString];
    NSMutableString *strMutableUDID = [NSMutableString stringWithString:strUDID];
    [strMutableUDID insertString:@"-" atIndex:8];
    [strMutableUDID insertString:@"-" atIndex:13];
    [strMutableUDID insertString:@"-" atIndex:18];
    [strMutableUDID insertString:@"-" atIndex:23];
    return strMutableUDID;
}

+ (NSString *)DeviceUUID{
    CFUUIDRef puuid = CFUUIDCreate(nil);
    CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
    NSString *result = (NSString *)CFBridgingRelease(CFStringCreateCopy(NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    return result;
}
+(NSString *)DeviceName
{
    return [[UIDevice currentDevice] name];
}

+(NSString *)LocalizedModel
{
    return [[UIDevice currentDevice] localizedModel];
}

#pragma mark -
#pragma mark check connect 

//判断有没有网络
+ (BOOL)isConnectedToNetwork
{
//    return ([[Reachability reachabilityWithHostName:@"www.apple.com"] currentReachabilityStatus] == NotReachable)? YES:NO;

    return [[AHReach reachForDefaultHost] isReachable];
}

#pragma mark -
#pragma mark URLEncoding
//  url utf-8编码转换
+ (NSString *)urlEncodingString:(NSString *)origion
{
//    NSString *encoded = (NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
//                                                                            (CFStringRef)origion,
//                                                                            NULL,
//                                                                            (CFStringRef)@"!*'();:@&=+$,/?%#[]",
//                                                                            kCFStringEncodingUTF8);
    NSString *encoded = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                              (CFStringRef)origion,
                                                                                              NULL,
                                                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                              kCFStringEncodingUTF8));
    return encoded;
}

+ (NSString *)urlDecodingString:(NSString *)encoded
{
    NSMutableString *resultString = [NSMutableString stringWithString:encoded];  
    [resultString replaceOccurrencesOfString:@"+"
                                  withString:@" "
                                     options:NSLiteralSearch
                                       range:NSMakeRange(0, [resultString length])];
    return [resultString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; 
}


#pragma mark - 
#pragma mark string 

//in which find out how many sinaWeibo enable words
+(NSInteger)TextLength:(NSString *)text
{
    float number = 0.0;
    for (int index = 0; index < [text length]; index++)
    {
        NSString *character = [text substringWithRange:NSMakeRange(index, 1)];
        
        if ([character lengthOfBytesUsingEncoding:NSUTF8StringEncoding] == 3)
        {
            number++;
        }
        else
        {
            number = number + 0.5;
        }
    }
    return ceil(number);
}

@end
