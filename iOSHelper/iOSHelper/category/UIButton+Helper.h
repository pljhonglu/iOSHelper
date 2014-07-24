//
//  UIButton+Helper.h
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Helper)
+ (UIButton*) buttonWithTarget:(id)target action:(SEL)sel;

- (void) setTextN:(NSString*)n H:(NSString*)h D:(NSString*)d S:(NSString *)s;
- (void) setImageN:(NSString*)n H:(NSString*)h D:(NSString*)d S:(NSString *)s;
@end
