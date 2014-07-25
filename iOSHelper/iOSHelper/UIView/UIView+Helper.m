//
//  UIView+Helper.m
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "UIView+Helper.h"

@implementation UIView (Helper)
#pragma mark - Dimension attributes

- (CGSize)size {
	return self.frame.size;
}

- (void)setSize:(CGSize)size {
	self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.x, size.width, size.height);
}

- (CGPoint)origin {
	return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
	self.frame = CGRectMake(origin.x, origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)width {
	return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
	self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
}

- (CGFloat)height {
	return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
	self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}

- (CGFloat)x {
	return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
	self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)y {
	return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
	self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}

#pragma mark - tag

- (void)setTagName:(NSString*)name{
    self.tag = [name hash];
}

- (UIView *)viewWithName:(NSString *)name{
    return [self viewWithTag:[name hash]];
}

#pragma mark - Alignment
- (void)setPosition:(CGRect)position{
    self.bounds = CGRectMake(0, 0, position.size.width, position.size.height);
    self.center = CGPointMake(position.origin.x,position.origin.y);
}

- (void)alignCenterToCenterOfSuperviewAnimated:(BOOL)animated {
	if (!self.superview)
		return;
	CGPoint newCenter = CGPointMake(self.superview.width / 2.0f, self.superview.height / 2.0f);
	if (animated)
		[UIView animateWithDuration:0.5f animations:^{
			self.center = newCenter;
		}];
	else
		self.center = newCenter;
}

- (void)alignCenterHorizontalToSuperviewAnimated:(BOOL)animated {
	if (!self.superview)
		return;
	CGPoint newCenter = CGPointMake(self.superview.width / 2.0f, self.center.y);
	if (animated)
		[UIView animateWithDuration:0.5f animations:^{
			self.center = newCenter;
		}];
	else
		self.center = newCenter;
}

- (void)alignCenterVerticalToSuperviewAnimated:(BOOL)animated {
	if (!self.superview)
		return;
    [self alignCenterVerticalWithHeight:self.superview.height animated:animated];
}

- (void)alignCenterVerticalWithHeight:(CGFloat)height animated:(BOOL)animated {
	if (!self.superview)
		return;
	CGPoint newCenter = CGPointMake(self.center.x, height / 2.0f);
	if (animated)
		[UIView animateWithDuration:0.5f animations:^{
			self.center = newCenter;
		}];
	else
		self.center = newCenter;
}
#pragma mark - 相对布局
- (void) autoResize:(UIViewAutoresizing)mask{
    self.autoresizingMask = mask;
    self.autoresizesSubviews = YES;
}



- (void)removeAllSubviews{
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
}

#pragma mark - Query

- (UIView *)subviewWhichSatisfy:(BOOL (^) (UIView *))block {
	for (UIView *aView in self.subviews)
		if (block(aView)) return aView;
	return nil;
}

- (NSArray *)subviewsWhichSatisfy:(BOOL (^) (UIView *))block {
    NSMutableArray* views = [NSMutableArray array];
	for (UIView *aView in self.subviews)
		if (block(aView))
            [views addObject:aView];
	return views;
}

- (UIView *)subviewOfAllSubviewsWhichSatisfy:(BOOL (^) (UIView *))block {
	for (UIView *aView in self.subviews)
		if (block(aView)) return aView;
	for (UIView *aView in self.subviews)
		return [aView subviewOfAllSubviewsWhichSatisfy:block];
	return nil;
}

- (NSArray *)subviewsOfAllSubviewsWhichSatisfy:(BOOL (^) (UIView *))block {
    NSMutableArray* views = [NSMutableArray array];
	for (UIView *aView in self.subviews)
		if (block(aView)) [views addObject:aView];
	for (UIView *aView in self.subviews)
		[views addObjectsFromArray:[aView subviewsOfAllSubviewsWhichSatisfy:block]];
	return views;
}

#pragma mark - Animation

- (void)animateRightBounce {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 0.1f;
    animation.repeatCount = 1.0f;
    animation.autoreverses = YES;
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x - 3.0f, self.center.y)];
    [self.layer addAnimation:animation forKey:@"position"];
}

- (void)animateLeftBounce {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 0.1f;
    animation.repeatCount = 1.0f;
    animation.autoreverses = YES;
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x + 3.0f, self.center.y)];
    [self.layer addAnimation:animation forKey:@"position"];
}

- (void)animateBottomBounce {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 0.1f;
    animation.repeatCount = 1.0f;
    animation.autoreverses = YES;
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y - 3.0f)];
    [self.layer addAnimation:animation forKey:@"position"];
}

- (void)animateTopBounce {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 0.1f;
    animation.repeatCount = 1.0f;
    animation.autoreverses = YES;
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y + 30.0f)];
    [self.layer addAnimation:animation forKey:@"position"];
}

- (void)fadeInWithDuration:(NSTimeInterval)duration {
    [UIView animateWithDuration:duration animations:^{ self.alpha = 1.0f; }];
}

- (void)fadeOutWithDuration:(NSTimeInterval)duration {
    [UIView animateWithDuration:duration animations:^{ self.alpha = 0.0f; }];
}
@end
