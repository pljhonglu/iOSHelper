//
//  UIAlertView+Helper.m
//  iOSHelper
//
//  Created by pljhonglu on 14-7-28.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "UIAlertView+Helper.h"

@implementation UIAlertView (Helper)
+ (void)showWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:title
                          message:message
                          delegate:nil
                          cancelButtonTitle:NSLocalizedString(@"OK", @"")
                          otherButtonTitles:nil];
    [alert show];
}

@end
