//
//  NSObject+Block.h
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Block)
-(void)performBlockOnThread:(NSBlockOperation*)aBlockOperation;
-(void)performBlockOnMainThread:(NSBlockOperation*)aBlockOperation;
-(void)performBlockOnBackgroundThread:(NSBlockOperation*)aBlockOperation;
+(void)runBlockOnMainThreadWithoutWait:( void ( ^ )( void ) )aBlock;
+(void)runBlockInBackGroundThreadWithoutWait:( void ( ^ )( void ) )aBlock;
+(void)runBlockOnMainThread:( void ( ^ )( void ) )aBlock NS_AVAILABLE_IOS(6_0);
+(void)runBlockInBackGroundThread:( void ( ^ )( void ) )aBlock;
@end
