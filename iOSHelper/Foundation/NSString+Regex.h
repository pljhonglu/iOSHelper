//
//  NSString+Regex.h
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regex)
- (BOOL) validateEmail;
//手机号码验证
- (BOOL) validateMobile;

//车牌号验证
- (BOOL) validateCarNo;

//车型
- (BOOL) validateCarType;

//用户名
- (BOOL) validateUserName;

//密码
- (BOOL) validatePassword;

//昵称
- (BOOL) validateNickname;

//身份证号
- (BOOL) validateIdentityCard;

//判断字符串是否符合正则表达式
- (BOOL)matchesWithRegex:(NSString *)regex;
//正则提取
- (NSString *)substringWithRegex:(NSString *)regex;
//提取匹配的字符串位置
- (NSRange) rangeOfFirstSubstringMatching:(NSString*)regex;
//正则提取为数租
- (NSArray *)matchesInRegex:(NSString *)regex error:(NSError **)error;
// 正则替换
- (NSString *)replaceWithString:(NSString *)str regex:(NSString *)regex;
@end
