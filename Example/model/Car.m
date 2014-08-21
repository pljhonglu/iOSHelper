//
//  Car.m
//  iOSHelper
//
//  Created by pljhonglu on 14-8-7.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "Car.h"
#import "Person.h"
#import "InsuranceCompany.h"

@implementation Car
+ (NSDictionary *)mappings {
    DLog(@"car mapping");
    return @{
             @"hp": @"horsePower",
             @"owner": @{
                     @"class": [Person class]
                     },
             @"insurance_id": @{
                     @"key": @"insuranceCompany",
                     @"class": [InsuranceCompany class]
                     },
             @"insurance_company": @{
                     @"key": @"insuranceCompany",
                     @"class": [InsuranceCompany class]
                     }
             
             };
}

@end
