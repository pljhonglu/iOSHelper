//
//  UIAlertView+Helper.h
//  iOSHelper
//
//  Created by pljhonglu on 14-7-28.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//
#import "UIScrollView+DeliveryEvent.h"

@implementation UIScrollView (DeliveryEvent)

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.isDragging) {
        [super touchesEnded:touches withEvent:event];
    } else {
        [self.nextResponder touchesEnded:touches withEvent:event];
    }
}
@end
