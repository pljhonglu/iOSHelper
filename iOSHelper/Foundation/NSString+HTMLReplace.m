//
//  NSString+HTMLReplace.m
//  AigoBest
//
//  Created by Aigo on 14-8-29.
//  Copyright (c) 2014年 Aigo. All rights reserved.
//

#import "NSString+HTMLReplace.h"

@implementation NSString (HTMLReplace)
- (NSString *)replaceKeyWithDic:(NSDictionary *)dict callBack:(HTMLReplaceBlock)cb{

    NSMutableString *tempString = [NSMutableString stringWithString:self];
    
    NSString *regulaStr = @"<% .*? %>";
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:tempString options:0 range:NSMakeRange(0, [tempString length])];
    NSString *substringForMatch = nil;
    NSInteger locationOffset = 0;//替换后range会发生偏移，该值用于计算偏移
    for (NSTextCheckingResult *match in arrayOfAllMatches){
        NSRange replaceRange = NSMakeRange(match.range.location+locationOffset, match.range.length);

        substringForMatch = [tempString substringWithRange:replaceRange];
//        DLog(@"substringForMatch : %@",substringForMatch);

        NSString *key = [substringForMatch substringWithRange:NSMakeRange(3, substringForMatch.length-6)];

        NSString *value = nil;
        if (cb) {
            value = cb(key);
        }
        if (!value || [value isEqual:[NSNull null]]) {
            value = dict[key];
        }
        if (!value || [value isEqual:[NSNull null]]) {
            value = @"";
        }
        [tempString replaceCharactersInRange:replaceRange withString:value];
        locationOffset += (value.length-substringForMatch.length);
//        DLog(@"%@",tempString);
    }
    return tempString;
}
@end
