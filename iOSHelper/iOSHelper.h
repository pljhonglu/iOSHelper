//
//  iOSHelper.h
//  iOSHelper
//
//  Created by pljhonglu on 14-7-28.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//
#ifndef iOSHelper_iOSHelper_h
#define iOSHelper_iOSHelper_h

#ifndef __IPHONE_6_0
#error iOSHelper only support iOS 6.0 and later
#endif


#import "Macro.h"

// Core Data
#import "CoreDataManager.h"
#import "NSManagedObject+helper.h"

// helper
#import "Lunar.h"
#import "CookiesHelper.h"
#import "ResourceHelper.h"
#import "SFHFKeychainUtils.h"

// UIKit
#import "UIImage+ImageEffects.h"
#import "UIAlertView+Helper.h"
#import "UIButton+Helper.h"
#import "UIControl+Helper.h"
#import "UIImage+Helper.h"
#import "UIScrollView+Helper.h"
#import "UIView+Helper.h"
#import "UIViewController+Helper.h"
#import "UIDevice+Helper.h"

// 这两个因为有覆盖父类的方法,所以根据需要在特定的类中加入
// #import "UIScrollView+DeliveryEvent.h"
// #import "UIScrollView+DeliveryAllEvents.h"

// Foundation
#import "NSArray+Helper.h"
#import "NSData+Helper.h"
#import "NSDate+Helper.h"
#import "NSDictionary+Helper.h"
#import "NSNotificationCenter+Helper.h"
#import "NSNumber+Helper.h"
#import "NSObject+DLIntrospection.h"
#import "NSObject+JSON.h"
#import "NSObject+Runtime.h"
#import "NSString+Helper.h"
#import "NSString+Regex.h"
#import "NSString+URL.h"
#import "UIColor+Helper.h"

#endif
