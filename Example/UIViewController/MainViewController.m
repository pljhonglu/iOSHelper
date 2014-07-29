//
//  MainViewController.m
//  iOSHelper
//
//  Created by Aigo on 14-7-29.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "MainViewController.h"
#import "iOSHelper.h"

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
    
    NSDate *date = [NSDate dateFromString:@"2013-07-28 23:23:22" withFormat:@"yyyy-MM-dd HH:mm:ss"];
    DLog(@"beginning of day : %@",[[date beginningOfDay] string]);
    DLog(@"string: %@",[date string]);
    
    NSString *string = @"独奏: http://jhonglu.duapp.com";
    
    NSString *encode = [[string dataValue] base64Encoding];
    DLog(@"%@",encode);
    
    NSData *data = [NSData dataWithBase64Encoding:encode];
    DLog(@"%@",[data stringValue]);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
