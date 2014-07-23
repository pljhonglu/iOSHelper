//
//  NSObject+Helper.m
//  iOSHelper
//
//  Created by Aigo on 14-7-23.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "NSObject+Helper.h"

@implementation NSObject (Helper)


#pragma mark - block
-(void)performBlockOnThread:(NSBlockOperation*)aBlockOperation {
    @autoreleasepool {
        [aBlockOperation start];
    }
}
-(void)performBlockOnMainThread:(NSBlockOperation*)aBlockOperation {
    [self performSelectorOnMainThread:@selector(performBlockOnThread:)
                           withObject:aBlockOperation
                        waitUntilDone:NO];
}
-(void)performBlockOnBackgroundThread:(NSBlockOperation*)aBlockOperation {
    [self performSelectorInBackground:@selector(performBlockOnThread:)
                           withObject:aBlockOperation];
}
+(void)runBlockOnMainThreadWithoutWait:( void ( ^ )( void ) )aBlock {
    NSBlockOperation* blkO = [NSBlockOperation blockOperationWithBlock:aBlock];
    @autoreleasepool {
        static NSObject* helper = nil;
        
        if (!helper) {
            helper = [[NSObject alloc] init];
        }
        [helper performBlockOnMainThread:blkO];
    }
    
}
+(void)runBlockInBackGroundThreadWithoutWait:( void ( ^ )( void ) )aBlock {
    NSBlockOperation* blkO = [NSBlockOperation blockOperationWithBlock:aBlock];
    
    @autoreleasepool {
        static NSObject* helper = nil;
        if (!helper) {
            helper = [[NSObject alloc] init];
        }
        [helper performBlockOnBackgroundThread:blkO];
    }
}

+(void)runBlockOnMainThread:( void ( ^ )( void ) )aBlock {
    
    dispatch_queue_t currentQueue = dispatch_get_current_queue();
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    __block BOOL didRunBlock = NO;
    void (^blockInTheMainThread)(void) = ^(void) {
        @autoreleasepool {
            aBlock ();
            didRunBlock = YES;
        }
    };
    
    if (currentQueue == mainQueue) {
        blockInTheMainThread();
    } else {
        dispatch_sync (mainQueue, blockInTheMainThread);
    }
}
+(void)runBlockInBackGroundThread:( void ( ^ )( void ) )aBlock {
    dispatch_queue_t queue = dispatch_queue_create("OtherBackgroundThread", NULL);
    
    dispatch_async(queue, ^(void) {
        @autoreleasepool {
            aBlock();
        }
    });
}

#pragma mark - runtime
- (NSString *)className{
    return [NSString stringWithUTF8String:object_getClassName(self)];
}
- (void)dictionaryForObject:(NSDictionary*) dict{
    for (NSString *key in [dict allKeys]) {
        id value = [dict objectForKey:key];
        
        if (value==[NSNull null]) {
            continue;
        }
        if ([value isKindOfClass:[NSDictionary class]]) {
            id subObj = [self valueForKey:key];
            if (subObj)
                [subObj dictionaryForObject:value];
        }
        else{
            [self setValue:value forKeyPath:key];
        }
    }
}
- (NSDictionary *)getPropertyDictionary{
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc] initWithUTF8String:property_getName(property)];
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        if (propertyValue) [props setObject:propertyValue forKey:propertyName];
    }
    free(properties);
    return props;
}

- (NSArray *)getPropertyList:(Class)clazz{
    u_int count;
    objc_property_t *properties = class_copyPropertyList(clazz, &count);
    NSMutableArray *propertyArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count ; i++)
    {
        const char* propertyName = property_getName(properties[i]);
        [propertyArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    free(properties); 
    return propertyArray;
}
@end
