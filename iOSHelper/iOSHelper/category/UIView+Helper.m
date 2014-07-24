//
//  UIView+Helper.m
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "UIView+Helper.h"

@implementation UIView (Helper)
- (float)x{
    return self.frame.origin.x;
}
- (float)y{
    return self.frame.origin.y;
}
- (float)width{
    return self.frame.size.width;
}
- (float)height{
    return self.frame.size.height;
}

- (void)setTagName:(NSString*)name{
    self.tag = [name hash];
}

- (UIView *)viewWithName:(NSString *)name{
    return [self viewWithTag:[name hash]];
}

- (void) autoResize:(UIViewAutoresizing)mask{
    self.autoresizingMask = mask;
    self.autoresizesSubviews = YES;
}

- (void)setPosition:(CGRect)position{
    self.bounds = CGRectMake(0, 0, position.size.width, position.size.height);
    self.center = CGPointMake(position.origin.x,position.origin.y);
}

- (void)removeAllSubviews{
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
}
@end
