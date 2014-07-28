//
//  NSString+Helper.h
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Helper)
/**
 Trim blank (space and newline).
 
 @return the trimmed string.
 */
- (NSString *) stringByTrim;

// nil, @"", @"  ", @"\n" will return NO, others will return YES.
- (BOOL) isNotBlank;

- (BOOL)equals:(NSString *)str;

- (CGFloat)heightByFont:(UIFont *)font width:(CGFloat)width;

/**
 utf-8编码转换
 @param origion 输入字符串
 @returns 经过utf-8编码的字符串
 */
- (NSString *)stringByURLEncode;

/**
 utf-8解码
 @param encoded 输入字符串
 @returns 经过utf-8解码的字符串
 */
- (NSString *)stringByURLDecode;

/**
 计算中英文混编字符串长度
 @param text 输入字符串
 @returns 返回字符串长度
 */
- (NSInteger)TextLength;
@end
