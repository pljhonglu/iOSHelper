//
//  InsuranceCompany.m
//  iOSHelper
//
//  Created by pljhonglu on 14-8-7.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "InsuranceCompany.h"
#import "Person.h"
#import "InsuranceCompany.h"

@implementation InsuranceCompany
+ (NSDictionary *)mappings {
    DLog(@"InsuranceCompany mapping");
    return @{
             @"id" : @"remoteID",
             @"owner_id" : @{
                     @"key"   : @"owner",
                     @"class" : [Person class] },
             @"owner" : @{
                     @"class" : [Person class] }
             };
}
@end
