//
//  NSString+Helper.h
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Helper)
//去除头部空格
-(NSString *) trimHead;
//去除尾部空格
-(NSString *) trimTail;
//去除首尾空格
- (NSString *) trimBoth;

- (BOOL)equals:(NSString *)str;

- (CGFloat)heightByFont:(UIFont *)font width:(CGFloat)width;

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

/**
 计算中英文混编字符串长度
 @param text 输入字符串
 @returns 返回字符串长度
 */
+ (NSInteger)TextLength:(NSString *)text;
@end
