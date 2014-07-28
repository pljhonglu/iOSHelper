//
//  NSString+URL.m
//  iOSHelper
//
//  Created by Aigo on 14-7-25.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "NSString+URL.h"

@implementation NSString (URL)

+(NSURL*)wwwURL:(NSString*)www
{
    return [NSURL URLWithString:www];
}

+(NSURL*)emailURL:(NSString*)email
{
    NSString *str = [NSString stringWithFormat:@"mailto:?to=%@", [email stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    return [NSURL URLWithString:str];
}

+(NSURL*)phoneURL:(NSString*)number
{
    NSString *str = [NSString stringWithFormat:@"tel://%@", number];
    return [NSURL URLWithString:str];
}

+(NSURL*)mapURL:(NSString*)address
{
    NSString* versionNum = [[UIDevice currentDevice] systemVersion];
    NSString *nativeMapScheme = @"maps.apple.com";
    if ([versionNum compare:@"6.0" options:NSNumericSearch] == NSOrderedAscending)
        nativeMapScheme = @"maps.google.com";
    
    NSString* url = [NSString stringWithFormat: @"http://%@/maps?q=%@", nativeMapScheme,
                     [address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    return [NSURL URLWithString:url];
}



- (NSString *)URLEncodedString
{
    CFStringRef resultString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                       (CFStringRef)self,
                                                                       NULL,
                                                                       CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                       kCFStringEncodingUTF8);
    return (NSString *)CFBridgingRelease(resultString);
}

- (NSString *)URLDecodedString
{
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+ (NSString *)stringWithURLEncodedDictionary:(NSDictionary *)dictionary
{
    NSMutableArray *components = [[NSMutableArray alloc] initWithCapacity:dictionary.count];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSString *objString = nil;
        if ([obj isKindOfClass:[NSString class]]) {
            objString = [obj URLEncodedString];
        } else if ([obj isKindOfClass:[NSNumber class]]) {
            objString = [obj stringValue];
        } else if ([obj isKindOfClass:[NSArray class]] ||
                   [obj isKindOfClass:[NSSet class]] ||
                   [obj isKindOfClass:[NSOrderedSet class]]) {
            NSMutableArray *objComponents = [NSMutableArray arrayWithCapacity:components.count];
            for (id objComponent in obj) {
                NSString *subObj = [objComponent isKindOfClass:[NSNumber class]]? [[objComponent stringValue] URLEncodedString]:[objComponent URLEncodedString];
                [objComponents addObject:subObj];
            }
            objString = [objComponents componentsJoinedByString:@","];
        }
        NSString *keyString = [key isKindOfClass:[NSNumber class]]? [[key stringValue] URLEncodedString]:[key URLEncodedString];
        NSString *component = [NSString stringWithFormat:@"%@=%@",
                               keyString,
                               objString];
        [components addObject:component];
    }];
    NSString *resultString = [components componentsJoinedByString:@"&"];
    return resultString;
}

- (NSDictionary *)URLDecodedDictionary
{
    NSArray *components = [self componentsSeparatedByString:@"&"];
    NSMutableDictionary *decodedDictionary = [[NSMutableDictionary alloc] initWithCapacity:components.count];
    [components enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *component = (NSString *)obj;
        NSUInteger dividerLocation = [component rangeOfString:@"="].location;
        if (dividerLocation != NSNotFound &&
            dividerLocation > 0 &&
            dividerLocation < component.length - 1) {
            NSString *key = [component substringToIndex:dividerLocation].URLDecodedString;
            NSString *value = [component substringFromIndex:dividerLocation + 1].URLDecodedString;
            if (![decodedDictionary.allKeys containsObject:key]) {
                [decodedDictionary setValue:value forKey:key];
            } else {
                NSString *oldValue = [decodedDictionary valueForKey:key];
                [decodedDictionary setValue:@[value, oldValue] forKey:key];
            }
        } else {
            NSLog(@"NSString (URLCoding): Wrong param: \"%@\"", component);
        }
    }];
    return decodedDictionary;
}

@end
