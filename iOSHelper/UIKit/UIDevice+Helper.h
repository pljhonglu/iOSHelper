//
//  UIDevice+Helper.h
//  iOSHelper
//
//  Created by pljhonglu on 14-7-28.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Helper)
/**
 Returns if the device has retina display.
 */
- (BOOL) isRetina;

/**
 Returns if the device is iPad/iPad Mini.
 */
- (BOOL) isPad;


/**
 Returns `YES` if the device is a simulator.
 */
- (BOOL) isSimulator;

/**
 Returns `YES` when this device is jailbroken.
 */
- (BOOL) isJailbreake;


- (BOOL)isOS4;
- (BOOL)isOS5;
- (BOOL)isOS6;
- (BOOL)isOS7;

/**
 Return the MAC address of this device.
 e.g. AA:BB:CC:DD:EE:FF
 */
@property (nonatomic,strong, readonly) NSString *macAddress;

/**
 Return the current IP address of this device.
 e.g. 192.168.1.1
 */
@property (nonatomic,strong, readonly) NSString *ipAddress;

/**
 Return avaliable device memory in Byte.
 Return -1 when error occured.
 */
@property (nonatomic, readonly) int64_t availableMemory;

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
 *  设备UUID
 *
 *  @return
 */
+ (NSString *)DeviceUUID;


@end
