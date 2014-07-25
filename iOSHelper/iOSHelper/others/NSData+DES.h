//
//  NSData+DES.h
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (DES)
- (NSData *)DESEncryptWithKey:(NSString *)key;//加密
- (NSData *)DESDecryptWithKey:(NSString *)key;//解密
@end
