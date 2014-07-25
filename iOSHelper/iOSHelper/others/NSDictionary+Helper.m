//
//  NSDictionary+Helper.m
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "NSDictionary+Helper.h"

@implementation NSDictionary (Helper)
- (id)objectForKeyNotNull:(id)key {
    id object = [self objectForKey:key];
    if (object == [NSNull null])
        return nil;
    return object;
}
@end
