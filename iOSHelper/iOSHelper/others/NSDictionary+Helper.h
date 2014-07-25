//
//  NSDictionary+Helper.h
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Helper)
//使取得的值不会使NSNull,在JSON解析的时候会有这种问题,有时候服务器返回了 {"test":null},但是被解析成了NSNull,这时APP这边处理起来会比较麻烦
- (id)objectForKeyNotNull:(id)key;
@end
