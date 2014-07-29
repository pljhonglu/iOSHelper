//
//  UIAlertView+Helper.h
//  iOSHelper
//
//  Created by pljhonglu on 14-7-28.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <UIKit/UIKit.h>

// UIScrollView会拦截所有事件，该category会向上传递事件，从而打破UIScrollView的拦截机制
// 滚动时拦截事件
@interface UIScrollView (DeliveryEvent)

@end
