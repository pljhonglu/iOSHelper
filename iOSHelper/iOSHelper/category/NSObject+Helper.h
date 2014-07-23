//
//  NSObject+Helper.h
//  iOSHelper
//
//  Created by Aigo on 14-7-23.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Helper)

-(void)performBlockOnThread:(NSBlockOperation*)aBlockOperation;
-(void)performBlockOnMainThread:(NSBlockOperation*)aBlockOperation;
-(void)performBlockOnBackgroundThread:(NSBlockOperation*)aBlockOperation;
+(void)runBlockOnMainThreadWithoutWait:( void ( ^ )( void ) )aBlock;
+(void)runBlockInBackGroundThreadWithoutWait:( void ( ^ )( void ) )aBlock;
+(void)runBlockOnMainThread:( void ( ^ )( void ) )aBlock NS_AVAILABLE_IOS(6_0);
+(void)runBlockInBackGroundThread:( void ( ^ )( void ) )aBlock;


- (NSString *)className;
// 根据dictionary来设置对象得property值
- (void)dictionaryForObject:(NSDictionary*) dict;
// 获取对象的property以及值，封装为dictionary
- (NSDictionary *)getPropertyDictionary;
// 获取property的array
- (NSArray *)getPropertyList:(Class)clazz;
@end
