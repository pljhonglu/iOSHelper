//  https://github.com/zhiyu/chartee/
//
//  Created by zhiyu on 7/11/11.
//  Copyright 2011 zhiyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ResourceHelper : NSObject

+ (NSString *)path_Home;
+ (NSString *)path_Documents;
+ (NSString *)path_Library;
+ (NSString *)path_Tmp;
+ (NSString *)path_Cache;

+ (NSString *)pathWithName:(NSString *)fileName;

+(NSObject *) getUserDefaults:(NSString *) name;
+(void) setUserDefaults:(NSObject *) defaults forKey:(NSString *) key;

@end
