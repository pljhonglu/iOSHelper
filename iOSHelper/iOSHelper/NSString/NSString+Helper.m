//
//  NSString+Helper.m
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "NSString+Helper.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Helper)
-(NSString *) trimHead{
    NSInteger i;
    NSCharacterSet *cs = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for(i = 0; i < [self length]; i++){
        if ( ![cs characterIsMember: [self characterAtIndex: i]] ) break;
    }
    return [self substringFromIndex: i];
}

-(NSString *) trimTail{
    NSInteger i;
    NSCharacterSet *cs = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for(i = [self length] -1; i >= 0; i--)
    {
        if ( ![cs characterIsMember: [self characterAtIndex: i]] ) break;
    }
    return [self substringToIndex: (i+1)];
}

- (NSString *) trimBoth{
    return [[self trimHead] trimTail];
}

- (BOOL)equals:(NSString *)str{
    return [self compare:str] == NSOrderedSame;
}

- (CGFloat)heightByFont:(UIFont *)font width:(CGFloat)width{
    NSDictionary *attributes = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                              options:NSStringDrawingTruncatesLastVisibleLine
                           attributes:attributes
                              context:nil].size.height;
}

+ (NSString *)urlEncodingString:(NSString *)origion{
    NSString *encoded = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                              (CFStringRef)origion,
                                                                                              NULL,
                                                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                              kCFStringEncodingUTF8));
    return encoded;
}

+ (NSString *)urlDecodingString:(NSString *)encoded{
    NSMutableString *resultString = [NSMutableString stringWithString:encoded];
    [resultString replaceOccurrencesOfString:@"+"
                                  withString:@" "
                                     options:NSLiteralSearch
                                       range:NSMakeRange(0, [resultString length])];
    return [resultString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+(NSInteger)TextLength:(NSString *)text{
    float number = 0.0;
    for (int index = 0; index < [text length]; index++){
        NSString *character = [text substringWithRange:NSMakeRange(index, 1)];
        
        if ([character lengthOfBytesUsingEncoding:NSUTF8StringEncoding] == 3){
            number++;
        }else{
            number = number + 0.5;
        }
    }
    return ceil(number);
}
@end
