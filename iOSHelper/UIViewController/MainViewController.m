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
    // Do any additional setup after loading the view from its nib.
//    UIImage *image = [UIImage imageWithColor:[UIColor cyanColor] Size:CGSizeMake(100, 100)];
//    UIImage *image = [UIImage imageName:@"aaa.jpg"];
//    DLog(@"%@",NSStringFromCGSize(image.size));
//    UIImage *newImage = [image scaleToSize:CGSizeMake(300, 300) withOffset:CGPointMake(30, 80)];
//    DLog(@"%@",NSStringFromCGSize(newImage.size));
//    _imageView.image = newImage;
//    DLog(@"%@",NSStringFromCGSize(_imageView.image.size));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Action01:(id)sender {
    NSDate *now = [NSDate dateFromString:@"2013-07-28 23:23:22" withFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSLog(@"beginning of day : %@",[[now beginningOfDay] string]);
    NSLog(@"string: %@",[now string]);

    DLog(@"display : %@",[NSDate stringForDisplayFromDate:now prefixed:YES]);
    
    DLog(@"formateyearMD : %@",[now getFormatYearMonthDay]);
    DLog(@"week day : %d",now.weekday);
    DLog(@"weekdayOrdinal : %d",now.weekdayOrdinal);
    DLog(@"weekOfMonth : %d",now.weekOfMonth);
    DLog(@"weekOfYear : %d",now.weekOfYear);
    DLog(@"yearForWeekOfYear : %d",now.yearForWeekOfYear);

    
}

- (IBAction)action01:(id)sender {

}

- (IBAction)action02:(id)sender {
}

- (IBAction)action03:(id)sender {
}

- (IBAction)action04:(id)sender {
}

- (IBAction)action05:(id)sender {
}

- (IBAction)action06:(id)sender {
}
@end
