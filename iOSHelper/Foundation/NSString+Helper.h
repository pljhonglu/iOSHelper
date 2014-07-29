//
//  NSString+Helper.h
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Helper)
- (NSNumber*)numberValue;
- (NSData *)dataValue;

// 去除首尾的空格和换行符
- (NSString *) stringByTrim;

// nil, @"", @"  ", @"\n" will return NO, others will return YES.
- (BOOL) isNotBlank;

- (BOOL)equals:(NSString *)str;

- (CGFloat)heightByFont:(UIFont *)font width:(CGFloat)width;

/**
 计算中英文混编字符串长度，单位长度包含一个中文字符或者两个英文字符
 @param text 输入字符串
 @returns 返回字符串长度
 */
- (NSInteger)TextLength;
@end
