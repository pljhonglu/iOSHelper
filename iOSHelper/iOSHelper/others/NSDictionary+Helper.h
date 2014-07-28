//
//  NSDictionary+Helper.h
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Helper)
/**
 *  使取得的值不会使NSNull,在JSON解析的时候会有这种问题,有时候服务器返回了 {"test":null},但是被解析成了NSNull,这时APP这边处理起来会比较麻烦
 *
 *  @param key
 *
 *  @return nil or NSObject
 */
- (id)objectForKeyNotNull:(id)key;

/**
 * 根据key排序，返回排序后的数组，key必须是nsstring
 *
 * @return 排序后的数组或者空数组
 */
- (NSArray *)allKeysSorted;

/**
 * 根据key排序的value数组
 *
 * @return 排序后的数组或者空数组
 */
- (NSArray *)allValuesSortedByKeys;

/**
 * 是否包含对应的key值
 *
 * @param key
 */
- (BOOL)containsObjectForKey:(id)key;

/**
 *  通过key获取CGPoint
 *
 *  @param key
 *
 *  @return CGPoint
 */
- (CGPoint)pointForKey:(NSString *)key;

- (CGSize)sizeForKey:(NSString *)key;

- (CGRect)rectForKey:(NSString *)key;

@end

//NSMutableDictionary helper

@interface NSMutableDictionary (Helper)

/**
 *  向字典中添加一个CGPoint
 *
 *  @param value CGPoint
 *  @param key   key
 */
- (void)setPoint:(CGPoint)value forKey:(NSString *)key;

- (void)setSize:(CGSize)value forKey:(NSString *)key;

- (void)setRect:(CGRect)value forKey:(NSString *)key;

@end
