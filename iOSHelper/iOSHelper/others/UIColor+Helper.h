//
//  UIColor+Helper.h
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Helper)
//通过RGBA值(比如红色FF0000FF)生成UIColor
+ (UIColor* ) colorWithHex:(int)color;
@end
