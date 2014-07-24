//
//  MainViewController.m
//  iOSHelper
//
//  Created by Aigo on 14-7-23.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "MainViewController.h"
#import "UIView+Helper.h"

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
    
    NSLog(@"%f ,%f ,%f ,%f",self.view.x,self.view.y,self.view.width,self.view.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
