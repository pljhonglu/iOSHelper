//
//  NSObject+Mappings.m
//  iOSHelper
//
//  Created by pljhonglu on 14-8-16.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "NSObject+Mappings.h"
#import "NSString+ObjectiveSugar.h"

NSString * const className = @"class";
NSString * const jsonData = @"data";
NSString * const propertyName = @"key";

@implementation NSObject (Mappings)

+ (instancetype)createWithDictionary:(NSDictionary *)attributes{
    
    NSObject *model = [[self class] new];
    NSDictionary *transformed = [[self class] transformProperties:attributes];
    NSError *error = nil;
    //    BOOL value = [self validateValue:@"QQQQ" forKey:@"ZZZ" error:&error];
    DLog(@"%@",transformed);
    return model;
}


- (void)update:(NSDictionary *)attributes{
    if (!attributes || [attributes isEqual:[NSNull null]]) {
        return;
    }
    // 把 json 的 key:value 映射变成类的 property:value 映射关系
    NSDictionary *transformed = [[self class] transformProperties:attributes];
    [self setValue:@"fff" forKey:@"vfg"];
    //    [self setValuesForKeysWithDictionary:Nil];
    DLog(@"%@",transformed);
}

+ (NSDictionary *)mappings {
    DLog(@"objectModel mapping");
    return nil;
}



#pragma mark - private
/**
 *  返回字典数据结构
 *  @{
 *      propertyName1 : @{@"class":ObjectModelSubClassName ,@"data":jsonData} ,
 *      propertyName2 : @{@"data":jsonData}
 *  }
 *
 */
+ (NSDictionary *)transformProperties:(NSDictionary *)properties{

    
    NSMutableDictionary *transformed = [NSMutableDictionary dictionaryWithCapacity:[properties count]];
    
    NSDictionary *map = [self mappings];
    for (NSString *key in properties) {
        id value = map[key];
        if (value) {
            // json_key -> propertyName
            if ([value isKindOfClass:[NSString class]]) {
                [transformed setObject:@{jsonData:properties[key]} forKey:value];
            }
            if ([value isKindOfClass:[NSDictionary class]]) {
                id returnDictValue = value[className]? @{jsonData:properties[key] ,className:value[className]} : @{jsonData:properties[key]};
                [transformed setObject:returnDictValue forKey:(value[propertyName]? value[propertyName]:key)];
            }
        }else{
            [transformed setObject:@{jsonData:properties[key]} forKey:key];
        }
    }
    
    return transformed;
}

- (void)setPropertiesWithDictionary:(NSDictionary *)dict{
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (!obj[className]) {
            SEL selector = NSSelectorFromString(key);
            objc_property_t list = class_copyPropertyList([self class], NULL);
            
        }
    }];
}
@end
