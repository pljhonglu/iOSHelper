//
//  NSFileManager+Helper.m
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "NSFileManager+Helper.h"

@implementation NSFileManager (Helper)
+ (BOOL)createFolder:(NSString *)folder atPath:(NSString *)path{
    NSString *savePath = [path stringByAppendingPathComponent:folder];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDirectory;
    BOOL exist = [fileManager fileExistsAtPath:savePath isDirectory:&isDirectory];
    NSError *error = nil;
    if (!exist || !isDirectory)
    {
        [fileManager createDirectoryAtPath:savePath withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    return [fileManager fileExistsAtPath:savePath isDirectory:&isDirectory];
}

+ (BOOL)saveData:(NSData *)data withName:(NSString *)name atPath:(NSString *)path{
    if (data && name && path)
    {
        NSString *filePath = [path stringByAppendingPathComponent:name];
        return [data writeToFile:filePath atomically:YES];
    }
    
    return NO;
}

+ (NSData *)findFile:(NSString *)fileName atPath:(NSString *)path{
    NSData *data = nil;
    if (fileName && path)
    {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *filePath = [path stringByAppendingPathComponent:fileName];
        
        if ([fileManager fileExistsAtPath:filePath])
        {
            data = [NSData dataWithContentsOfFile:filePath];
        }
    }
    
    return data;
}

+ (BOOL)deleteFile:(NSString *)fileName atPath:(NSString *)path{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    NSError *error;
    BOOL success = [fileManager removeItemAtPath:filePath error:&error];
    return success;
}



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
@end
