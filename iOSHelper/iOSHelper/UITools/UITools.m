//
//  UITools.m
//  vik_learning_ios
//
//  Created by viktyz on 13-2-21.
//  Copyright (c) 2013年 neu. All rights reserved.
//

#import "UITools.h"

@implementation UITools

#pragma mark -
#pragma mark Image Handler

+ (UIImage *)scaleImage:(UIImage *)image toScale:(CGFloat)scaleSize
{
    return [self scaleImage:image widthRatio:scaleSize heightRatio:scaleSize];
}

+ (UIImage *)scaleImage:(UIImage *)image widthRatio:(CGFloat)_rationWidth
{
    return [self scaleImage:image widthRatio:_rationWidth heightRatio:1];
}

+ (UIImage *)scaleImage:(UIImage *)image heightRatio:(CGFloat)_ratioHeight
{
    return [self scaleImage:image widthRatio:1 heightRatio:_ratioHeight];
}

+ (UIImage *)scaleImage:(UIImage *)image widthRatio:(CGFloat)_rationWidth heightRatio:(CGFloat)_ratioHeight
{
    if (image == nil) {
		return image;
	}
    
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * _rationWidth, 
                                           image.size.height * _ratioHeight));
    
    [image drawInRect:CGRectMake(0, 
                                 0, 
                                 image.size.width * _rationWidth, 
                                 image.size.height * _ratioHeight)];
    
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

+ (UIImage*)resizeImage:(UIImage*)image toSize:(CGSize)sizeTarget
{
	if (image == nil) {
		return image;
	}
	
	CGSize sizeImage	= image.size;
	UIImage	*imgRtn		= nil;
	
	if (sizeImage.height == sizeTarget.height && sizeImage.width == sizeTarget.width) {
		return image;
	}
    
    UIGraphicsBeginImageContext(sizeTarget);  
    [image drawInRect:CGRectMake(0, 0, sizeTarget.width, sizeTarget.height)];  
    imgRtn = UIGraphicsGetImageFromCurrentImageContext();  
    UIGraphicsEndImageContext();  
    return imgRtn; 
}

#pragma mark -
#pragma mark AlertView Handler

+(void) showConfirm:(NSString*) message 
           delegate:(id<UIAlertViewDelegate>) delegate 
               with:(NSInteger)tag 
{
    UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"友情提示：" message:message  delegate:delegate cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil ];
    alert.tag = tag;
    [alert show];
}

+(void) showAlert:(NSString*) message 
         delegate:(id<UIAlertViewDelegate>) delegate
{
    UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"友情提示：" message:message  delegate:delegate cancelButtonTitle:@"确定" otherButtonTitles:nil,nil ];
    [alert show];
}

+(void) showAlert:(NSString*) message 
         delegate:(id<UIAlertViewDelegate>) delegate 
             with:(NSInteger)tag
{
    UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"友情提示：" message:message  delegate:delegate cancelButtonTitle:@"确定" otherButtonTitles:nil,nil ];
    alert.tag = tag;
    [alert show];
}

#pragma mark -
#pragma mark UIView

+ (void)displayView:(UIView*)aView 
		   animated:(BOOL)bAnimation
{
	if (bAnimation == YES) {
		[UIView beginAnimations:@"showButton"
						context:nil];
		[UIView setAnimationDuration:0.3f];
	}
	
	aView.alpha = 1.0f;
	
	if (bAnimation == YES) {
		[UIView commitAnimations];
	}
}

+ (void)hideView:(UIView*)aView 
		animated:(BOOL)bAnimation
{
	if (bAnimation == YES) {
		[UIView beginAnimations:@"hideButton"
						context:nil];
		[UIView setAnimationDuration:0.3f];
	}
	
	aView.alpha = 0.0f;
	
	if (bAnimation == YES) {
		[UIView commitAnimations];
	}
}

+ (void)animationToScaleUpView:(UIView *)aView
{
	if (aView == nil) {
		return;
	}
	
	CAKeyframeAnimation		*animation		= nil; 
	NSMutableArray			*arrTransform	= [NSMutableArray arrayWithCapacity:0];
	
	animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"]; 
	animation.duration = 0.1f; 
	animation.delegate = self;
	animation.removedOnCompletion = YES;
	animation.fillMode = kCAFillModeForwards;
	
	[arrTransform addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.5, 1.5, 1.0)]];
	[arrTransform addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
	animation.values = arrTransform;
	[aView.layer addAnimation:animation forKey:nil];
}

+(UIImage *)imageFromView:(UIView *)aView
{
    UIGraphicsBeginImageContext(aView.layer.bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [aView.layer renderInContext:context];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

@end
