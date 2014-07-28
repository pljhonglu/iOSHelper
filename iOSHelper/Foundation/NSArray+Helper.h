//
//  NSArray+Helper.h
//  iOSHelper
//
//  Created by pljhonglu on 14-7-28.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Helper)

- (id)firstObject;

- (id)randomObject;

/**
 *  返回指定位置的对象，如果数组越界则返回 nil
 *
 *  @param index
 *
 *  @return object or nil
 */
- (id)objectOrNilAtIndex:(NSUInteger)index;

@end


@interface NSMutableArray (Helper)

/**
*  插入一条数据，如果是 nil 在不会插入
*
*  @param anObject object or nil
*/
- (void)addObjectOrNil:(id)anObject;

- (void)removeFirstObject;

/**
 *  反序数组，@[ @1, @2, @3 ] -> @[ @3, @2, @1 ]
 */
- (void) reverse;

/**
 * 打乱数组顺序
 */
- (void) shuffle;

@end