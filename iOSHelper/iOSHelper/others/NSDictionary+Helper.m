//
//  NSDictionary+Helper.m
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "NSDictionary+Helper.h"

@implementation NSDictionary (Helper)
- (id)objectForKeyNotNull:(id)key {
    id object = [self objectForKey:key];
    if (object == [NSNull null])
        return nil;
    return object;
}

- (NSArray *)allKeysSorted {
    return [[self allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

- (NSArray *)allValuesSortedByKeys {
    NSArray *sortedKeys = [self allKeysSorted];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (id key in sortedKeys) {
        [arr addObject:self[key]];
    }
    return arr;
}

- (BOOL)containsObjectForKey:(id)key {
	return [[self allKeys] containsObject:key];
}


- (CGPoint)pointForKey:(NSString *)key
{
    CGPoint point = CGPointZero;
    NSDictionary *dictionary = [self valueForKey:key];
    BOOL success = CGPointMakeWithDictionaryRepresentation((__bridge CFDictionaryRef)dictionary, &point);
    if (success) return point;
    else return CGPointZero;
}

- (CGSize)sizeForKey:(NSString *)key
{
    CGSize size = CGSizeZero;
    NSDictionary *dictionary = [self valueForKey:key];
    BOOL success = CGSizeMakeWithDictionaryRepresentation((__bridge CFDictionaryRef)dictionary, &size);
    if (success) return size;
    else return CGSizeZero;
}

- (CGRect)rectForKey:(NSString *)key
{
    CGRect rect = CGRectZero;
    NSDictionary *dictionary = [self valueForKey:key];
    BOOL success = CGRectMakeWithDictionaryRepresentation((__bridge CFDictionaryRef)dictionary, &rect);
    if (success) return rect;
    else return CGRectZero;
}

@end




@implementation NSMutableDictionary (Helper)

- (void)setPoint:(CGPoint)value forKey:(NSString *)key {
    NSDictionary *dictionary = (__bridge NSDictionary *)CGPointCreateDictionaryRepresentation(value);
    [self setValue:dictionary forKey:key];
    dictionary = nil;
}

- (void)setSize:(CGSize)value forKey:(NSString *)key {
    NSDictionary *dictionary = (__bridge NSDictionary *)CGSizeCreateDictionaryRepresentation(value);
    [self setValue:dictionary forKey:key];
    dictionary = nil;
}

- (void)setRect:(CGRect)value forKey:(NSString *)key {
    NSDictionary *dictionary = (__bridge NSDictionary *)CGRectCreateDictionaryRepresentation(value);
    [self setValue:dictionary forKey:key];
    dictionary = nil;
}

@end
