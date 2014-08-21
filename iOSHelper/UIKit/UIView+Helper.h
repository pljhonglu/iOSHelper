//
//  UIView+Helper.h
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define FlexibleT                   UIViewAutoresizingFlexibleTopMargin
#define FlexibleB                   UIViewAutoresizingFlexibleBottomMargin
#define FlexibleL                   UIViewAutoresizingFlexibleLeftMargin
#define FlexibleR                   UIViewAutoresizingFlexibleRightMargin
#define FlexibleH                   UIViewAutoresizingFlexibleHeight
#define FlexibleW                   UIViewAutoresizingFlexibleWidth

#define FixedMarginT                FlexibleW | FlexibleB
#define FixedMarginB                FlexibleW | FlexibleT
#define FixedMarginL                FlexibleH | FlexibleR
#define FixedMarginR                FlexibleH | FlexibleL
#define FixedHorizental             FlexibleW | FlexibleT | FlexibleB
#define FixedVertical               FlexibleH | FlexibleL | FlexibleR
#define FixedALL                    FlexibleW | FlexibleH
#define FixedCenter                 FlexibleL | FlexibleR | FlexibleT | FlexibleB

/**
 *  	FixedMarginB	 	下侧距离固定
 *      FixedMarginL	 	左侧距离固定
 *      FixedMarginR	 	右侧距离固定
 *      FixedHorizental	 	左右距离固定
 *      FixedVertical	 	上下距离固定
 *      FixedALL            四周距离固定
 *      FixedCenter         居中
 */

@interface UIView (Helper)
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, strong, readonly) UIViewController *viewController;


- (void)setTagName:(NSString*)name;
- (UIView *)viewWithName:(NSString *)name;

- (void) autoResize:(UIViewAutoresizing)mask;

- (void)removeAllSubviews;

// Positioning
- (void)setPosition:(CGRect)position;
- (void)alignCenterToCenterOfSuperviewAnimated:(BOOL)animated;
- (void)alignCenterHorizontalToSuperviewAnimated:(BOOL)animated;
- (void)alignCenterVerticalToSuperviewAnimated:(BOOL)animated;
- (void)alignCenterVerticalWithHeight:(CGFloat)height animated:(BOOL)animated;

// Query
/**
 *  查找满足条件的view，满足条件的话在block里返回yes
 *  前两个方法只遍历view的subview
 *  后两个方法递归遍历subview
 */
- (UIView *)subviewWhichSatisfy:(BOOL (^) (UIView *))block;
- (NSArray *)subviewsWhichSatisfy:(BOOL (^) (UIView *))block;
- (UIView *)subviewOfAllSubviewsWhichSatisfy:(BOOL (^) (UIView *))block;
- (NSArray *)subviewsOfAllSubviewsWhichSatisfy:(BOOL (^) (UIView *))block;

// Animation
- (void)fadeInWithDuration:(NSTimeInterval)duration;
- (void)fadeOutWithDuration:(NSTimeInterval)duration;
@end
