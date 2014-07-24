//
//  UIButton+Helper.m
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "UIButton+Helper.h"

@implementation UIButton (Helper)
+ (UIButton*) buttonWithTarget:(id)target action:(SEL)sel{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void) setTextN:(NSString*)n H:(NSString*)h D:(NSString*)d S:(NSString *)s{
    if ( n ){
        [self setTitle:n forState:UIControlStateNormal];
    }
    if ( h ){
        [self setTitle:h forState:UIControlStateHighlighted];
    }
    if ( d ){
        [self setTitle:d forState:UIControlStateDisabled];
    }
    if ( s ){
        [self setTitle:s forState:UIControlStateSelected];
    }
}

- (void) setImageN:(NSString*)n H:(NSString*)h D:(NSString*)d S:(NSString *)s{
    if ( n ){
        [self setImage:[UIImage imageNamed:n] forState:UIControlStateNormal];
    }
    if ( h ){
        [self setImage:[UIImage imageNamed:h] forState:UIControlStateHighlighted];
    }
    if ( d ){
        [self setImage:[UIImage imageNamed:d] forState:UIControlStateDisabled];
    }
    if ( s ){
        [self setImage:[UIImage imageNamed:s] forState:UIControlStateSelected];
        if ( h ){
            [self setImage:[UIImage imageNamed:h] forState:UIControlStateHighlighted | UIControlStateSelected];
        }
        
    }
}

@end
