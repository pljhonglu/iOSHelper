//
//  NSObject+Runtime.h
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)

+ (NSString *)className;
- (NSString *)className;

// 根据dictionary来设置对象得property值
- (void)dictionaryForObject:(NSDictionary*) dict;
// 获取对象的property以及值，封装为dictionary
- (NSDictionary *)getPropertyDictionary;
// 获取property的array
- (NSArray *)getPropertyList:(Class)clazz;

//关于method的hook
/*
 这种替换方式可以在类内调用旧的实现，在load方法里面替换
 例：
 - (void)override_drawRect: (NSRect)r
 {
    // 这里调用的实际是[self drawRect:r]，因为这两方法已经被替换了，所以并不是递归调用
    [self override_drawRect: r];
 
    [[NSColor blueColor]set];
    NSRectFill(r);
 }
 */

// 交换成员方法
+ (BOOL)swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_;
// 交换类方法
+ (BOOL)swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError**)error_;
// 向类中添加方法
+ (void)appendMethod:(SEL)newMethod fromClass:(Class)aClass;
// 替换方法
+ (void)replaceMethod:(SEL)aMethod fromClass:(Class)aClass;



@end
