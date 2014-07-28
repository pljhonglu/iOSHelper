//
//  NSNumber+Helper.h
//  iOSHelper
//
//  Created by Aigo on 14-7-28.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Helper)
/**
 Creates and returns an NSNumber object from a string.
 
 Valid format: @"12", @"12.345", @" -0xFF", @" .23e99 "..
 If parse string error, it will return nil.
 
 @param string The string described an number.
 @return an NSNumber when parse success,or return nil if error occured.
 */
+ (NSNumber *)numberWithString:(NSString *)string;
@end
