//
//  InsuranceCompany.h
//  iOSHelper
//
//  Created by pljhonglu on 14-8-7.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectModel.h"

@class Car, Person;

@interface InsuranceCompany : ObjectModel
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * remoteID;
@property (nonatomic, retain) NSSet *cars;
@property (nonatomic, retain) Person *owner;

@end
