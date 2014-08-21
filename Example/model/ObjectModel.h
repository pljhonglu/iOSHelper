//
//  ObjectModel.h
//  iOSHelper
//
//  Created by pljhonglu on 14-8-6.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const className;
extern NSString * const propertyName;

@interface ObjectModel : NSObject

//- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)createWithDictionary:(NSDictionary *)dict;

- (void)update:(NSDictionary *)dict;

+ (NSDictionary *)mappings;
@end
