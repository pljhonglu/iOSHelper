//
//  FirstViewController.m
//  iOSHelper
//
//  Created by Aigo on 14-7-25.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissViewController:(id)sender {
//    NSLog(@"%@",self.navigationController);
//    [self dismissPopUpViewController];
    [self dismissThisViewController];
//    [self.navigationController popViewControllerAnimated:YES];
}
@end
