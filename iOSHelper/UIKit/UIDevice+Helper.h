//
//  UIDevice+Helper.h
//  iOSHelper
//
//  Created by pljhonglu on 14-7-28.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Helper)

// e.g. AA:BB:CC:DD:EE:FF
@property (nonatomic,strong, readonly) NSString *macAddress;
// e.g. 192.168.1.1
@property (nonatomic,strong, readonly) NSString *ipAddress;
// 系统可用内存，Byte，错误返回 -1
@property (nonatomic, readonly) int64_t availableMemory;

- (BOOL) isRetina;
- (BOOL) isPad;
- (BOOL) isSimulator;
// 检测越狱
- (BOOL) isJailbreake;

- (BOOL)isOS4;
- (BOOL)isOS5;
- (BOOL)isOS6;
- (BOOL)isOS7;

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
 设备的名称，如 张三的iPhone
 @returns 设备的名称
 */
+(NSString *)DeviceName;
/**
 设备UUID
 @return such as 9E9E0A02-A916-4406-964D-0FBCDA6B0216
 */
+ (NSString *)DeviceUUID;

@end
