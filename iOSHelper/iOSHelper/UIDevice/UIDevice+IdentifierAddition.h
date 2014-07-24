//
//  UIDevice(Identifier).h
//  UIDeviceAddition
//
//  Created by Georg Kitz on 20.08.11.
//  Copyright 2011 Aurora Apps. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIDevice (IdentifierAddition)

/*
 * @method uniqueDeviceIdentifier
 * @description use this method when you need a unique identifier in one app.
 * It generates a hash from the MAC-address in combination with the bundle identifier
 * of your app.
 */

- (NSString *) uniqueDeviceIdentifier;

/*
 * @method uniqueGlobalDeviceIdentifier
 * @description use this method when you need a unique global identifier to track a device
 * with multiple apps. as example a advertising network will use this method to track the device
 * from different apps.
 * It generates a hash from the MAC-address only.
 */

- (NSString *) uniqueGlobalDeviceIdentifier;

/** return a double type number in MB size for the device available memory */
+(double)availableMemory;




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

@end
