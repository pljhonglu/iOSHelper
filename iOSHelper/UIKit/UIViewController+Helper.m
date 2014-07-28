//
//  UIViewController+Helper.m
//  iOSHelper
//
//  Created by Aigo on 14-7-25.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "UIViewController+Helper.h"

@implementation UIViewController (Helper)
- (void)dismissThisViewController{
    if (!self.navigationController || ![self.navigationController popViewControllerAnimated:YES]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
