//
//  NSString+Regex.m
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "NSString+Regex.h"

@implementation NSString (Regex)
//邮箱
- (BOOL) validateEmail{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

//手机号码验证
- (BOOL) validateMobile{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

//车牌号验证
- (BOOL) validateCarNo{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:self];
}

//车型
- (BOOL) validateCarType{
    NSString *CarTypeRegex = @"^[\u4E00-\u9FFF]+$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CarTypeRegex];
    return [carTest evaluateWithObject:self];
}

//用户名
- (BOOL) validateUserName{
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:self];
    return B;
}

//密码
- (BOOL) validatePassword{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:self];
}

//昵称
- (BOOL) validateNickname{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:self];
}

//身份证号
- (BOOL) validateIdentityCard{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}


- (NSString *)replaceWithString:(NSString *)str regex:(NSString *)regex
{
    NSError *error = nil;
    NSRegularExpression *regEx = [NSRegularExpression regularExpressionWithPattern:regex options:NSRegularExpressionCaseInsensitive error:&error];
    NSString *modifiedString = [regEx stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, [self length]) withTemplate:str];
    return modifiedString;
}

- (BOOL)matchesWithRegex:(NSString *)regex{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}
- (NSString *)substringWithRegex:(NSString *)regex{
    NSRange range = [self rangeOfString:regex options:NSRegularExpressionSearch];
    if (range.location != NSNotFound) {
        return [self substringWithRange:range];
    }
    return nil;
}
- (NSArray *)matchesInRegex:(NSString *)regex error:(NSError *__autoreleasing *)error{
    NSRegularExpression *regEx = [NSRegularExpression regularExpressionWithPattern:regex options:NSRegularExpressionCaseInsensitive error:error];
    NSArray *result = [regEx matchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, self.length)];
    return result;
    
}
@end
