//
//  Car.h
//  iOSHelper
//
//  Created by pljhonglu on 14-8-7.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectModel.h"

@class InsuranceCompany, Person;

@interface Car : ObjectModel
@property (nonatomic, retain) NSNumber * horsePower;
@property (nonatomic, retain) NSString * make;
@property (nonatomic, retain) Person *owner;
@property (nonatomic, retain) InsuranceCompany *insuranceCompany;
@end
