//
//  SecondViewController.m
//  iOSHelper
//
//  Created by Aigo on 14-7-25.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
//    NSLog(@"%@ %@ %@ %@ %@",self.navigationController,self.navigationController.topViewController,self,self.navigationController.visibleViewController,self.navigationController.viewControllers);
//    UIViewController *vc = [self.navigationController popViewControllerAnimated:YES];
//    NSLog(@"%@",vc);
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self dismissThisViewController];
}
@end
