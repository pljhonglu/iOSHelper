//
//  MainViewController.m
//  iOSHelper
//
//  Created by Aigo on 14-7-29.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "MainViewController.h"
#import "iOSHelper.h"
#import "Person.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDictionary *JSON = @{
                           @"id":@2,
                           @"first_name": @"Marin",
                           @"last_name": @"Usalj",
                           @"age": @25,
                           @"is_member": @"true",
                           @"cars": @[
                                   @{ @"hp": @220, @"make": @"Trabant" },
                                   @{ @"hp": @90, @"make": @"Volkswagen" }
                                   ],
                           @"manager": @{
                                   @"firstName": @"Delisa",
                                   @"lastName": @"Mason",
                                   @"age": @25,
                                   @"isMember": @NO
                                   },
                           @"employees": @[
                                   @{ @"first_name": @"Luca" },
                                   @{ @"first_name": @"Tony" },
                                   @{ @"first_name": @"Jim" }
                                   ]
                           };
    Person *person = [Person createWithDictionary:JSON];
    
    NSDictionary *dict = nil;
    
    NSLog(@"%@",dict[@"a"]);

//    [Person mappings];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
