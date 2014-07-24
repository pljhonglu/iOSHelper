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
- (float)x;
- (float)y;
- (float)width;
- (float)height;


- (void)setTagName:(NSString*)name;

- (UIView *)viewWithName:(NSString *)name;
- (void) autoResize:(UIViewAutoresizing)mask;
- (void)setPosition:(CGRect)position;

- (void)removeAllSubviews;
@end
