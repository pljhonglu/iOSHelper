//
//  UIColor+Helper.m
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "UIColor+Helper.h"

@implementation UIColor (Helper)

+ (UIColor* ) colorWithHex:(int)color {
    float red = (color & 0xff000000) >> 24;
    float green = (color & 0x00ff0000) >> 16;
    float blue = (color & 0x0000ff00) >> 8;
    float alpha = (color & 0x000000ff);
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha/255.0];
}

@end
