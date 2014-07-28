//
//  UIImage+Helper.m
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "UIImage+Helper.h"

@implementation UIImage (Helper)
//复制当前图片
- (UIImage *)duplicate{
    CGImageRef newCgIm = CGImageCreateCopy(self.CGImage);
    UIImage *newImage = [UIImage imageWithCGImage:newCgIm scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(newCgIm);
    return newImage;
}

//使当前图片可拉伸
- (UIImage *)stretched{
    CGSize size = self.size;
    UIEdgeInsets insets = UIEdgeInsetsMake(truncf(size.height-1)/2, truncf(size.width-1)/2, truncf(size.height-1)/2, truncf(size.width-1)/2);
    return [self resizableImageWithCapInsets:insets];
}

//使当前图片抗锯齿(当图片在旋转时有用, 原理就是在图片周围加1px的透明像素)
- (UIImage *)antiAlias{
    int border = 1;
    CGRect rect = CGRectMake(border, border, self.size.width-2*border, self.size.height-2*border);
    
    UIImage *img = nil;
    
    UIGraphicsBeginImageContext(CGSizeMake(rect.size.width,rect.size.height));
    [self drawInRect:CGRectMake(-1, -1, self.size.width, self.size.height)];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(self.size);
    [img drawInRect:rect];
    UIImage* antiImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return antiImage;
}

//创建纯色的图片
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+ (UIImage *)imageWithColor:(UIColor *)color Size:(CGSize)size{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [image stretched];
}

//imageNamed的非缓存版
+ (UIImage *)imageName:(NSString *)name{
    NSString *path = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:[NSString stringWithFormat:@"/%@",name]];
    
    return [UIImage imageWithContentsOfFile:path];
}


+(UIImage*)screenShot{
	CGRect screenRect = [[UIScreen mainScreen] bounds];
	
	UIGraphicsBeginImageContext(screenRect.size);
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextClearRect(ctx , screenRect);
	
	UIApplication * app = [UIApplication sharedApplication];
	UIWindow * win = [app keyWindow];
	[win.layer renderInContext:ctx];
	CGContextFlush(ctx);
	
	UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return img;
}

#pragma mark private

- (void)addRoundedRectToPath:(CGContextRef)context rect:(CGRect)rect radius:(float)radius {
	CGContextBeginPath(context);
	CGContextSaveGState(context);
	
	if (radius == 0) {
		CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
		CGContextAddRect(context, rect);
	} else {
		CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
		CGContextScaleCTM(context, radius, radius);
		float fw = CGRectGetWidth(rect) / radius;
		float fh = CGRectGetHeight(rect) / radius;
		
		CGContextMoveToPoint(context, fw, fh/2);
		CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);
		CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1);
		CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1);
		CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1);
	}
	
	CGContextClosePath(context);
	CGContextRestoreGState(context);
}
#pragma mark Public
- (UIColor *)colorAtPoint:(CGPoint )point{
    if (point.x < 0 || point.y < 0) return nil;
    
    CGImageRef imageRef = self.CGImage;
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    if (point.x >= width || point.y >= height) return nil;
    
    unsigned char *rawData = malloc(height * width * 4);
    if (!rawData) return nil;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    CGContextRef context = CGBitmapContextCreate(rawData,
                                                 width,
                                                 height,
                                                 bitsPerComponent,
                                                 bytesPerRow,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast
                                                 | kCGBitmapByteOrder32Big);
    if (!context) {
        free(rawData);
        return nil;
    }
    CGColorSpaceRelease(colorSpace);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    CGContextRelease(context);
    
    int byteIndex = (bytesPerRow * point.y) + point.x * bytesPerPixel;
    CGFloat red   = (rawData[byteIndex]     * 1.0) / 255.0;
    CGFloat green = (rawData[byteIndex + 1] * 1.0) / 255.0;
    CGFloat blue  = (rawData[byteIndex + 2] * 1.0) / 255.0;
    CGFloat alpha = (rawData[byteIndex + 3] * 1.0) / 255.0;
    
    UIColor *result = nil;
    result = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    free(rawData);
    return result;
}

- (BOOL)hasAlphaChannel {
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(self.CGImage);
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}

- (UIImage*)scaleToSize:(CGSize)size {
	UIGraphicsBeginImageContext(size);
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextTranslateCTM(context, 0.0, size.height);
	CGContextScaleCTM(context, 1.0, -1.0);
	
	CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, size.width, size.height), self.CGImage);
	
	UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	return scaledImage;
}

- (UIImage*)scaleAndCropToSize:(CGSize)size {
	if(size.height > size.width) {
		if(self.size.height > self.size.width) {
			if((self.size.width  / self.size.height) >= (size.width / size.height)) {
				return [self scaleHeightAndCropWidthToSize:size];
			} else {
				return [self scaleWidthAndCropHeightToSize:size];
			}
		} else {
			return [self scaleHeightAndCropWidthToSize:size];
		}
	} else {
		if(self.size.width > self.size.height) {
			if((self.size.height / self.size.width) >= (size.height / size.width)) {
				return [self scaleWidthAndCropHeightToSize:size];
			} else {
				return [self scaleHeightAndCropWidthToSize:size];
			}
		} else {
			return [self scaleWidthAndCropHeightToSize:size];
		}
	}
}

- (UIImage*)scaleHeightAndCropWidthToSize:(CGSize)size {
	float newWidth = (self.size.width * size.height) / self.size.height;
	return [self scaleToSize:size withOffset:CGPointMake((newWidth - size.width) / 2, 0.0f)];
}

- (UIImage*)scaleWidthAndCropHeightToSize:(CGSize)size {
	float newHeight = (self.size.height * size.width) / self.size.width;
	return [self scaleToSize:size withOffset:CGPointMake(0, (newHeight - size.height) / 2)];
}

- (UIImage*)scaleToSize:(CGSize)size withOffset:(CGPoint)offset {
	UIImage* scaledImage = [self scaleToSize:CGSizeMake(size.width + (offset.x * -2), size.height + (offset.y * -2))];
	
	UIGraphicsBeginImageContext(size);
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextTranslateCTM(context, 0.0, size.height);
	CGContextScaleCTM(context, 1.0, -1.0);
	
	CGRect croppedRect;
	croppedRect.size = size;
	croppedRect.origin = CGPointZero;
	
	CGContextClipToRect(context, croppedRect);
	
	CGRect drawRect;
	drawRect.origin = offset;
	drawRect.size = scaledImage.size;
	
	CGContextDrawImage(context, drawRect, scaledImage.CGImage);
	
	
	UIImage* croppedImage = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	return croppedImage;
}

- (void)drawInRect:(CGRect)rect contentMode:(UIViewContentMode)contentMode {
	BOOL clip = NO;
	CGRect originalRect = rect;
	if (self.size.width != rect.size.width || self.size.height != rect.size.height) {
		if (contentMode == UIViewContentModeLeft) {
			rect = CGRectMake(rect.origin.x,
							  rect.origin.y + floor(rect.size.height/2 - self.size.height/2),
							  self.size.width, self.size.height);
			clip = YES;
		} else if (contentMode == UIViewContentModeRight) {
			rect = CGRectMake(rect.origin.x + (rect.size.width - self.size.width),
							  rect.origin.y + floor(rect.size.height/2 - self.size.height/2),
							  self.size.width, self.size.height);
			clip = YES;
		} else if (contentMode == UIViewContentModeTop) {
			rect = CGRectMake(rect.origin.x + floor(rect.size.width/2 - self.size.width/2),
							  rect.origin.y,
							  self.size.width, self.size.height);
			clip = YES;
		} else if (contentMode == UIViewContentModeBottom) {
			rect = CGRectMake(rect.origin.x + floor(rect.size.width/2 - self.size.width/2),
							  rect.origin.y + floor(rect.size.height - self.size.height),
							  self.size.width, self.size.height);
			clip = YES;
		} else if (contentMode == UIViewContentModeCenter) {
			rect = CGRectMake(rect.origin.x + floor(rect.size.width/2 - self.size.width/2),
							  rect.origin.y + floor(rect.size.height/2 - self.size.height/2),
							  self.size.width, self.size.height);
		} else if (contentMode == UIViewContentModeBottomLeft) {
			rect = CGRectMake(rect.origin.x,
							  rect.origin.y + floor(rect.size.height - self.size.height),
							  self.size.width, self.size.height);
			clip = YES;
		} else if (contentMode == UIViewContentModeBottomRight) {
			rect = CGRectMake(rect.origin.x + (rect.size.width - self.size.width),
							  rect.origin.y + (rect.size.height - self.size.height),
							  self.size.width, self.size.height);
			clip = YES;
		} else if (contentMode == UIViewContentModeTopLeft) {
			rect = CGRectMake(rect.origin.x,
							  rect.origin.y,
							  self.size.width, self.size.height);
			clip = YES;
		} else if (contentMode == UIViewContentModeTopRight) {
			rect = CGRectMake(rect.origin.x + (rect.size.width - self.size.width),
							  rect.origin.y,
							  self.size.width, self.size.height);
			clip = YES;
		} else if (contentMode == UIViewContentModeScaleAspectFill) {
			CGSize imageSize = self.size;
			if (imageSize.height < imageSize.width) {
				imageSize.width = floor((imageSize.width/imageSize.height) * rect.size.height);
				imageSize.height = rect.size.height;
			} else {
				imageSize.height = floor((imageSize.height/imageSize.width) * rect.size.width);
				imageSize.width = rect.size.width;
			}
			rect = CGRectMake(rect.origin.x + floor(rect.size.width/2 - imageSize.width/2),
							  rect.origin.y + floor(rect.size.height/2 - imageSize.height/2),
							  imageSize.width, imageSize.height);
		} else if (contentMode == UIViewContentModeScaleAspectFit) {
			CGSize imageSize = self.size;
			if (imageSize.height < imageSize.width) {
				imageSize.height = floor((imageSize.height/imageSize.width) * rect.size.width);
				imageSize.width = rect.size.width;
			} else {
				imageSize.width = floor((imageSize.width/imageSize.height) * rect.size.height);
				imageSize.height = rect.size.height;
			}
			rect = CGRectMake(rect.origin.x + floor(rect.size.width/2 - imageSize.width/2),
							  rect.origin.y + floor(rect.size.height/2 - imageSize.height/2),
							  imageSize.width, imageSize.height);
		}
	}
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	if (clip) {
		CGContextSaveGState(context);
		CGContextAddRect(context, originalRect);
		CGContextClip(context);
	}
	
	[self drawInRect:rect];
	
	if (clip) {
		CGContextRestoreGState(context);
	}
}

- (void)drawInRect:(CGRect)rect radius:(CGFloat)radius {
	[self drawInRect:rect radius:radius contentMode:UIViewContentModeScaleToFill];
}

- (void)drawInRect:(CGRect)rect radius:(CGFloat)radius contentMode:(UIViewContentMode)contentMode {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);
	if (radius) {
		[self addRoundedRectToPath:context rect:rect radius:radius];
		CGContextClip(context);
	}
	
	[self drawInRect:rect contentMode:contentMode];
	
	CGContextRestoreGState(context);
}

@end
