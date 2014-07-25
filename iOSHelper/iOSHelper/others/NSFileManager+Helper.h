//
//  NSFileManager+Helper.h
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Helper)
/**
 *  在相应目录下创建一个文件夹。
 *  @param  folder:文件夹名。
 *  @param  path:文件夹所在路径。
 *  return  成功返回YES，失败返回NO。若已存在直接返回YES。
 */
+ (BOOL)createFolder:(NSString *)folder atPath:(NSString *)path;

/**
 *  保存文件到相应路径下。
 *  @param  data:要保存的数据。
 *  @param  name:要保存的文件名，如a.txt等。
 *  @param  path:文件保存的路径目录。
 *  return  成功返回YES，失败返回NO。
 */
+ (BOOL)saveData:(NSData *)data withName:(NSString *)name atPath:(NSString *)path;

/**
 *  查找并返回文件。
 *  @param  fileName:要查找的文件名。
 *  @param  path:文件所在的目录。
 *  return  成功返回文件，失败返回nil。
 */
+ (NSData *)findFile:(NSString *)fileName atPath:(NSString *)path;

/**
 *  删除文件。
 *  @param  fileName:要删除的文件名。
 *  @param  path:文件所在的目录。
 *  return  成功返回YES，失败返回NO。
 */
+ (BOOL)deleteFile:(NSString *)fileName atPath:(NSString *)path;


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

@end
