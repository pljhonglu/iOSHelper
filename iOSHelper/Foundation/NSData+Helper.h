//
//  NSData+Helper.h
//  iOSHelper
//
//  Created by Aigo on 14-7-28.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Helper)

- (NSString *)stringValue;
///=============================================================================
/// @name Hash (返回NSString均为小写)
///=============================================================================

- (NSString *)md2String;
- (NSData *)md2Data;

- (NSString *)md4String;
- (NSData *)md4Data;

- (NSString *)md5String;
- (NSData *)md5Data;

- (NSString *)sha1String;
- (NSData *)sha1Data;

- (NSString *)sha224String;
- (NSData *)sha224Data;

- (NSString *)sha256String;
- (NSData *)sha256Data;

- (NSString *)sha384String;
- (NSData *)sha384Data;

- (NSString *)sha512String;
- (NSData *)sha512Data;


- (NSString *)hmacMD5StringWithKey:(NSString *)key;
- (NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)hmacSHA224StringWithKey:(NSString *)key;
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)hmacSHA384StringWithKey:(NSString *)key;
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

- (NSString *)crc32String;
- (uint32_t)crc32;

///=============================================================================
/// @name 加密/解密
///=============================================================================

/**
 AES加密
 
 @param key A key length of 16, 24 or 32 (128, 192 or 256bits).
 @param iv An initialization vector length of 16(128bits).
 Pass nil when you don't want to use iv.
 @return An NSData encrypted, or nil when error occured.
 */
- (NSData *)AES256EncryptWithKey:(NSData *)key iv:(NSData *)iv;

/**
 AES解密
 
 @param key A key length of 16, 24 or 32 (128, 192 or 256bits).
 @param iv An initialization vector length of 16(128bits).
 Pass nil when you don't want to use iv.
 @return An NSData decrypted, or nil when error occured.
 */
- (NSData *)AES256DecryptWithKey:(NSData *)key iv:(NSData *)iv;

///=============================================================================
/// @name 编码/解码
/// 相对而言，十六进制编码速度快、编码后的体积大 / base64编码速度慢、编码后体积小
///=============================================================================

/**
 *  十六进制编码
 *
 *  @return 返回编码后的字符串
 */
- (NSString *)hexString;
/**
 *  十六进制解码
 *
 *  @param hexString 十六进制编码形式的字符串，不区分大小写
 *
 *  @return 解码后的NSData
 */
+ (NSData *)dataWithHexString:(NSString *)hexString;

/**
 *  把NSData使用 base64 编码
 *
 *  @return 返回 base64 编码后的字符串
 */
- (NSString *)base64Encoding;
/**
 *  把使用base64编码的字符串解码成NSData
 *
 *  @param base64Encoding 使用base64编码的字符串
 *
 *  @return 解码后得到的NSdata
 */
+ (NSData *)dataWithBase64Encoding:(NSString *)base64Encoding;


///=============================================================================
/// @name 压缩/解压缩
///=============================================================================

/**
 Decompress data from gzip data.
 
 @return Inflated data.
 */
- (NSData *)gzipInflate;

/**
 Comperss data to gzip in default compresssion level.
 
 @return Deflated data.
 */
- (NSData *)gzipDeflate;

/**
 Decompress data from zlib-compressed data.
 
 @return Inflated data.
 */
- (NSData *) zlibInflate;

/**
 Comperss data to zlib-compressed in default compresssion level.
 
 @return Deflated data.
 */
- (NSData *) zlibDeflate;

@end
