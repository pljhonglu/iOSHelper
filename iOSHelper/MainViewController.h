//
//  MainViewController.h
//  iOSHelper
//
//  Created by Aigo on 14-7-23.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *aView;


- (IBAction)pushViewController:(id)sender;
- (IBAction)presentViewController:(id)sender;

@end
