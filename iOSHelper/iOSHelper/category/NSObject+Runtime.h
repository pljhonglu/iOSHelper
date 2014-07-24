//
//  NSObject+Runtime.h
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Runtime)
+ (NSString *)className;
- (NSString *)className;
// 根据dictionary来设置对象得property值
- (void)dictionaryForObject:(NSDictionary*) dict;
// 获取对象的property以及值，封装为dictionary
- (NSDictionary *)getPropertyDictionary;
// 获取property的array
- (NSArray *)getPropertyList:(Class)clazz;
@end
