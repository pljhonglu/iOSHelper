//  https://github.com/zhiyu/chartee/
//
//  Created by zhiyu on 7/11/11.
//  Copyright 2011 zhiyu. All rights reserved.
//

#import "ResourceHelper.h"

@implementation ResourceHelper

+ (NSString *)path_Home{
    return NSHomeDirectory();
}
+ (NSString *)path_Documents{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}
+ (NSString *)path_Library{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}
+ (NSString *)path_Tmp{
    return NSTemporaryDirectory();
}
+ (NSString *)path_Cache{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}


+(NSObject *) getUserDefaults:(NSString *) name{
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:name];
}

+(void) setUserDefaults:(NSObject *) defaults forKey:(NSString *) key{
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:defaults forKey:key];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

//+ (BOOL)archiveObject:(id<NSCoding>)obj key:(NSString *)key{
//    NSMutableData *data = [[NSMutableData alloc] init];
//    
//    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
//    
//    [archiver encodeObject:obj forKey:key];
//    
//    [archiver finishEncoding];
//    
//    [data writeToFile:[self getFilePath] atomically:YES];
//}


@end
