//
//  NSObject+Block.m
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "NSObject+Block.h"

@implementation NSObject (Block)
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
@end
