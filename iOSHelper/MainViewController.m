//
//  MainViewController.m
//  iOSHelper
//
//  Created by Aigo on 14-7-23.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "MainViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "iOSHelper/UIViewController/UIViewController+Helper.h"
#import "iOSHelper/UIView/UIView+Helper.h"

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
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushViewController:(id)sender {
//    FirstViewController *firstV = [[FirstViewController alloc]init];
////    [self presentPopUpViewController:firstV];
//    [self.navigationController pushViewController:firstV animated:YES];
    
    //    [_aView fadeOutWithDuration:1];
}

- (IBAction)presentViewController:(id)sender {
//    SecondViewController *secondV = [[SecondViewController alloc]init];
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:secondV];
//    [self presentViewController:secondV];
//    [self presentViewController:nav animated:YES completion:nil];
//    [_aView animateLeftBounce];
}
@end
