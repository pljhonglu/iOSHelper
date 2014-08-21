//
//  Person.h
//  iOSHelper
//
//  Created by pljhonglu on 14-8-7.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectModel.h"

@class Car, InsuranceCompany;

@interface Person : ObjectModel
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSDate * anniversary;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSNumber * isMember;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSNumber * remoteID;
@property (nonatomic, retain) NSNumber * savings;
@property (nonatomic, retain) NSSet *cars;
@property (nonatomic, retain) NSSet *employees;
@property (nonatomic, retain) Person *manager;
@property (nonatomic, retain) InsuranceCompany *insuranceCompany;

@end
