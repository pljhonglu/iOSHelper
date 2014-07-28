//
//  UIControl+Helper.h
//  iOSHelper
//
//  Created by pljhonglu on 14-7-28.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (Helper)

- (void)removeAllTargets;

// 添加或替换一个 target
- (void)setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

///=============================================================================
/// @name Block action added
///=============================================================================

- (void)addBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block;

//添加或替换
- (void)setBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block;

- (void)removeAllBlocksForControlEvents:(UIControlEvents)controlEvents;

@end
