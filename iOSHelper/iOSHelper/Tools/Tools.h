//
//  Tools.h
//  vik_learning_ios
//
//  Created by viktyz on 13-2-6.
//  Copyright (c) 2013年 neu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject

#pragma mark -
#pragma mark file system

/**
 获取全部磁盘空间
 @returns 磁盘空间(单位：bytes)
 */
+ (NSNumber*) totalDiskSpace;

/**
 获取可用磁盘空间
 @returns 可用空间(单位：bytes)
 */
+ (NSNumber*) freeDiskSpace;

//以下为 Private document(推荐)

/**
 获取完整路径
 @param _fileName 文件名
 @param _groupName 文件夹名
 @returns 返回 _groupName 文件夹内 _fileName 文件完整路径
 */
+ (NSString *)fileFullPathWithName:(NSString *)_fileName inGroup:(NSString *)_groupName;

/**
 检查文件是否存在
 @param _fileName 文件名
 @param _groupName 文件夹名
 @returns 文件存在返回 YES;文件不存在返回 NO;
 */
+ (BOOL)isFileExist:(NSString *)_filename inGroup:(NSString *)_groupName;


/**
 删除文件
 @param _filename 文件名
 @param _groupName 文件夹名
 @returns 删除成功返回 YES;删除失败返回 NO;
 */
+ (BOOL)deleteFile:(NSString *)_filename inGroup:(NSString *)_groupName;


/**
 删除文件夹
 @param _groupName 文件夹名
 @returns 删除成功返回 YES;删除失败返回 NO;
 */
+ (BOOL)deleteGroup:(NSString *)_groupName;



//以下为 User document(建议使用Private document)

/**
 获取完整路径
 @param fileName 文件名
 @returns 返回文件完整路径
 */
+ (NSString *)fileFullPathWithName:(NSString *)fileName;


/**
 检查文件是否存在
 @param name 文件名
 @returns 文件存在返回 YES;文件不存在返回 NO;
 */
+(BOOL)isFileExist:(NSString *)fileName;


/**
 删除文件
 @param fileName 文件名
 @returns 删除成功返回 YES;删除失败返回 NO;
 */
+ (BOOL)deleteFile:(NSString*)fileName;


#pragma mark -
#pragma mark time method


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


#pragma mark -
#pragma mark Application method


/**
 判断是否首次操作
 @param _operationName 操作名称
 @returns 如果首次操作则返回 YES 如果非首次操作则返回 NO
 */
+(BOOL)isFirstOperate:(NSString *)_operationName;


/**
 是否隐藏StatusBar
 @param _hidden YES 则为隐藏 NO 则为显示
 */
+(void)setStatusBarHidden:(BOOL)_hidden;


#pragma mark -
#pragma mark Device method

/**
 系统名称，如iPhone OS
 @returns 系统名称
 */
+(NSString *)SystemName;


/**
 系统版本，如4.2.1
 @returns 系统版本
 */
+(NSString *)SystemVersion;


/**
 The model of the device，如iPhone或者iPod touch
 @returns The model of the device
 */
+(NSString *)DeviceModel;


/**
 设备的惟一标识号，deviceID
 (由于Apple公司对UDID保密性的要求,不推荐使用该方法，建议使用 UniqueIdentifier_Soft)
 @returns 设备的惟一标识号
 */
+(NSString *)UniqueIdentifier_Hard;


/**
 设备的惟一标识号，deviceID
 @returns 设备的惟一标识号,获取的是mac地址,不推荐使用
 */
+(NSString *)UniqueIdentifier_Soft;

/**
 获取设备的UUID
 @returns 设备的UUID
 */
+(NSString *)DeviceUUID;

/**
 设备的名称，如 张三的iPhone
 @returns 设备的名称
 */
+(NSString *)DeviceName;

/**
 The model of the device as a localized string，类似model
 @returns The model of the device as a localized string
 */
+(NSString *)LocalizedModel;

#pragma mark -
#pragma mark check connect

/**
 判断有没有网络
 @returns YES-有网络 NO-没网络
 */
+ (BOOL)isConnectedToNetwork;

#pragma mark -
#pragma mark URLEncoding
/**
 utf-8编码转换
 @param origion 输入字符串
 @returns 经过utf-8编码的字符串
 */
+ (NSString *)urlEncodingString:(NSString *)origion;


/**
 utf-8解码
 @param encoded 输入字符串
 @returns 经过utf-8解码的字符串
 */
+ (NSString *)urlDecodingString:(NSString *)encoded;


#pragma mark -
#pragma mark string

/**
 计算中英文混编字符串长度
 @param text 输入字符串
 @returns 返回字符串长度
 */
+ (NSInteger)TextLength:(NSString *)text;

@end
