//
//  UIScrollView+Helper.h
//  iOSHelper
//
//  Created by pljhonglu on 14-7-28.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Helper)

- (void)scrollToTop;
- (void)scrollToBottom;
- (void)scrollToLeft;
- (void)scrollToRight;

- (void)scrollToTopAnimated:(BOOL)animated;
- (void)scrollToBottomAnimated:(BOOL)animated;
- (void)scrollToLeftAnimated:(BOOL)animated;
- (void)scrollToRightAnimated:(BOOL)animated;

@end
