//
//  NSString+URL.h
//  iOSHelper
//
//  Created by Aigo on 14-7-25.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URL)

+(NSURL*)wwwURL:(NSString*)www;
+(NSURL*)emailURL:(NSString*)email;
+(NSURL*)phoneURL:(NSString*)number;
+(NSURL*)mapURL:(NSString*)address;

//对字符串进行URL编码
- (NSString *)URLEncodedString;
- (NSString *)URLDecodedString;

+ (NSString *)stringWithURLEncodedDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)URLDecodedDictionary;
@end
