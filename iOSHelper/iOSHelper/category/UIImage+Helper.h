//
//  UIImage+Helper.h
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Helper)
//创建纯色的图片
+ (UIImage *)imageWithColor:(UIColor *)color Size:(CGSize)size;

//imageNamed的非缓存版
+ (UIImage *)imageName:(NSString *)name;

//复制当前图片
- (UIImage *)duplicate;

//使当前图片可拉伸
- (UIImage *)stretched;

//使当前图片抗锯齿(当图片在旋转时有用, 原理就是在图片周围加1px的透明像素)
- (UIImage *)antiAlias;


// 获取当前屏幕截图
+(UIImage*)screenShot;

// 设置图片大小
- (UIImage*)scaleToSize:(CGSize)size;

/*
 * Scales and crops the image to the given size
 * Automatically detects the size/height and offset
 * Sides of the image will be cropped so the result is centered
 */
- (UIImage*)scaleAndCropToSize:(CGSize)size;

/*
 * Scales the height and crops the width to the size
 * Sides of the image will be cropped so the result is centered
 */
- (UIImage*)scaleHeightAndCropWidthToSize:(CGSize)size;

/*
 * Scales the width and crops the height to the size
 * Sides of the image will be cropped so the result is centered
 */
- (UIImage*)scaleWidthAndCropHeightToSize:(CGSize)size;

/*
 * Scales image to the size, crops to the offset
 * Provide offset based on scaled size, not original size
 *
 * Example:
 * Image is 640x480, scaling to 480x320
 * This will then scale to 480x360
 *
 * If you want to vertically center the image, set the offset to CGPointMake(0.0,-20.0f)
 * Now it will clip the top 20px, and the bottom 20px giving you the desired 480x320
 */
- (UIImage*)scaleToSize:(CGSize)size withOffset:(CGPoint)offset;

/**
 * Draws the image using content mode rules.
 */
- (void)drawInRect:(CGRect)rect contentMode:(UIViewContentMode)contentMode;

/**
 * Draws the image as a rounded rectangle.
 */
- (void)drawInRect:(CGRect)rect radius:(CGFloat)radius;
- (void)drawInRect:(CGRect)rect radius:(CGFloat)radius contentMode:(UIViewContentMode)contentMode;

@end
