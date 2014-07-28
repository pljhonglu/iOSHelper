//
//  UIControl+Helper.m
//  iOSHelper
//
//  Created by pljhonglu on 14-7-28.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "UIControl+Helper.h"
#import <objc/runtime.h>

static const int block_key;

@interface _HLUIControlBlockTarget : NSObject
@property (nonatomic, copy) void (^ block)(id sender);
@property (nonatomic, assign) UIControlEvents events;
- (id)initWithBlock:(void(^)(id sender))block events:(UIControlEvents)events;
- (void)invoke:(id)sender;
@end

@implementation _HLUIControlBlockTarget
@synthesize block = _block;
@synthesize events = _events;
- (id)initWithBlock:(void(^)(id sender))block events:(UIControlEvents)events{
    self = [super init];
    if (self) {
        self.block = block;
        self.events = events;
    }
    return self;
}
- (void)invoke:(id)sender {
    if (self.block) {
        self.block(sender);
    }
}
@end

@implementation UIControl (Helper)
- (void)removeAllTargets {
	[[self allTargets] enumerateObjectsUsingBlock:^(id object, BOOL *stop) {
		[self removeTarget:object
                    action:NULL
          forControlEvents:UIControlEventAllEvents];
	}];
}

- (void)setTarget:(id)target
           action:(SEL)action
 forControlEvents:(UIControlEvents)controlEvents {
    
	NSSet *targets = [self allTargets];
	for (id currentTarget in targets) {
		NSArray *actions = [self actionsForTarget:currentTarget
                                  forControlEvent:controlEvents];
        
		for (NSString *currentAction in actions) {
			[self removeTarget:currentTarget
                        action:NSSelectorFromString(currentAction)
              forControlEvents:controlEvents];
		}
	}
	[self addTarget:target action:action forControlEvents:controlEvents];
}







- (void)addBlockForControlEvents:(UIControlEvents)controlEvents
                           block:(void (^)(id sender))block {
    _HLUIControlBlockTarget *target = [[_HLUIControlBlockTarget alloc]
                                       initWithBlock:block events:controlEvents];
    [self addTarget:target action:@selector(invoke:) forControlEvents:controlEvents];
    NSMutableArray *targets = [self _allBlockTargets];
    [targets addObject:target];
}

- (void)setBlockForControlEvents:(UIControlEvents)controlEvents
                           block:(void (^)(id sender))block{
    [self removeAllBlocksForControlEvents:controlEvents];
    [self addBlockForControlEvents:controlEvents block:block];
}

- (void)removeAllBlocksForControlEvents:(UIControlEvents)controlEvents{
    NSMutableArray *targets = [self _allBlockTargets];
    NSMutableArray *removes = [NSMutableArray array];
    [targets enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        _HLUIControlBlockTarget *target = (_HLUIControlBlockTarget *)obj;
        if (target.events == controlEvents) {
            [removes addObject:target];
            [self removeTarget:target
                        action:@selector(invoke:)
              forControlEvents:controlEvents];
        }
    }];
    [targets removeObjectsInArray:removes];
}


- (NSMutableArray *)_allBlockTargets {
    NSMutableArray *targets = nil;
    @synchronized(self){
        targets = objc_getAssociatedObject(self, &block_key);
        if (!targets) {
            targets = [NSMutableArray array];
            objc_setAssociatedObject(self, &block_key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    return targets;
}

@end
