//
//  NSManagedObject+Helper.m
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "NSManagedObject+Helper.h"

@implementation NSManagedObject (Helper)
+(id)createNew{
    NSString *className = [NSString stringWithUTF8String:object_getClassName(self)];
    return [NSEntityDescription insertNewObjectForEntityForName:className inManagedObjectContext:[CoreDataManager instance].mainObjectContext];
}

+(NSError*)save:(OperationResult)handler{
    return [[CoreDataManager instance] save:handler];
}

+(NSArray*)filter:(NSString *)predicate orderby:(NSArray *)orders offset:(int)offset limit:(int)limit{
    
    NSManagedObjectContext *ctx = [CoreDataManager instance].mainObjectContext;
    NSFetchRequest *fetchRequest = [self makeRequest:ctx predicate:predicate orderby:orders offset:offset limit:limit];
    
    NSError* error = nil;
    NSArray* results = [ctx executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"error: %@", error);
        return @[];
    }
    return results;
}


+(NSFetchRequest*)makeRequest:(NSManagedObjectContext*)ctx predicate:(NSString*)predicate orderby:(NSArray*)orders offset:(int)offset limit:(int)limit{
    NSString *className = [NSString stringWithUTF8String:object_getClassName(self)];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:className inManagedObjectContext:ctx]];
    if (predicate) {
        [fetchRequest setPredicate:[NSPredicate predicateWithFormat:predicate]];
    }
    NSMutableArray *orderArray = [[NSMutableArray alloc] init];
    if (orders!=nil) {
        for (NSString *order in orders) {
            NSSortDescriptor *orderDesc = nil;
            if ([[order substringToIndex:1] isEqualToString:@"-"]) {
                orderDesc = [[NSSortDescriptor alloc] initWithKey:[order substringFromIndex:1]
                                                        ascending:NO];
            }else{
                orderDesc = [[NSSortDescriptor alloc] initWithKey:order
                                                        ascending:YES];
            }
            [orderArray addObject:orderDesc];
        }
        [fetchRequest setSortDescriptors:orderArray];
    }
    if (offset>0) {
        [fetchRequest setFetchOffset:offset];
    }
    if (limit>0) {
        [fetchRequest setFetchLimit:limit];
    }
    return fetchRequest;
}

+(void)filter:(NSString *)predicate orderby:(NSArray *)orders offset:(int)offset limit:(int)limit on:(ListResult)handler{
    
    NSManagedObjectContext *ctx = [[CoreDataManager instance] createPrivateObjectContext];
    [ctx performBlock:^{
        NSFetchRequest *fetchRequest = [self makeRequest:ctx predicate:predicate orderby:orders offset:offset limit:limit];
        NSError* error = nil;
        NSArray* results = [ctx executeFetchRequest:fetchRequest error:&error];
        if (error) {
            NSLog(@"error: %@", error);
            [[CoreDataManager instance].mainObjectContext performBlock:^{
                handler(@[], nil);
            }];
        }
        if ([results count]<1) {
            [[CoreDataManager instance].mainObjectContext performBlock:^{
                handler(@[], nil);
            }];
        }
        NSMutableArray *result_ids = [[NSMutableArray alloc] init];
        for (NSManagedObject *item  in results) {
            [result_ids addObject:item.objectID];
        }
        [[CoreDataManager instance].mainObjectContext performBlock:^{
            NSMutableArray *final_results = [[NSMutableArray alloc] init];
            for (NSManagedObjectID *oid in result_ids) {
                [final_results addObject:[[CoreDataManager instance].mainObjectContext objectWithID:oid]];
            }
            handler(final_results, nil);
        }];
    }];
}


+(id)one:(NSString*)predicate{
    NSManagedObjectContext *ctx = [CoreDataManager instance].mainObjectContext;
    NSFetchRequest *fetchRequest = [self makeRequest:ctx predicate:predicate orderby:nil offset:0 limit:1];
    NSError* error = nil;
    NSArray* results = [ctx executeFetchRequest:fetchRequest error:&error];
    //    if ([results count] > 1) {
    //        raise(1);
    //    }
    if ([results count] < 1) {
        return nil;
    }
    return results[0];
}

+(void)one:(NSString*)predicate on:(ObjectResult)handler{
    NSManagedObjectContext *ctx = [[CoreDataManager instance] createPrivateObjectContext];
    [ctx performBlock:^{
        NSFetchRequest *fetchRequest = [self makeRequest:ctx predicate:predicate orderby:nil offset:0 limit:1];
        NSError* error = nil;
        NSArray* results = [ctx executeFetchRequest:fetchRequest error:&error];
        if (error) {
            NSLog(@"error: %@", error);
            [[CoreDataManager instance].mainObjectContext performBlock:^{
                handler(@[], nil);
            }];
        }
        if ([results count]<1) {
            [[CoreDataManager instance].mainObjectContext performBlock:^{
                handler(@[], nil);
            }];
        }
        NSManagedObjectID *objId = ((NSManagedObject*)results[0]).objectID;
        [[CoreDataManager instance].mainObjectContext performBlock:^{
            handler([[CoreDataManager instance].mainObjectContext objectWithID:objId], nil);
        }];
    }];
}


+(void)delobject:(id)object{
    [[CoreDataManager instance].mainObjectContext deleteObject:object];
    
}

+(void)async:(AsyncProcess)processBlock result:(ListResult)resultBlock{
    NSString *className = [NSString stringWithUTF8String:object_getClassName(self)];
    NSManagedObjectContext *ctx = [[CoreDataManager instance] createPrivateObjectContext];
    [ctx performBlock:^{
        id resultList = processBlock(ctx, className);
        if (resultList) {
            if ([resultList isKindOfClass:[NSError class]]) {
                [[CoreDataManager instance].mainObjectContext performBlock:^{
                    resultBlock(nil, resultList);
                }];
            }
            if ([resultList isKindOfClass:[NSArray class]]) {
                NSMutableArray *idArray = [[NSMutableArray alloc] init];
                for (NSManagedObject *obj in resultList) {
                    [idArray addObject:obj.objectID];
                }
                NSArray *objectIdArray = [idArray copy];
                [[CoreDataManager instance].mainObjectContext performBlock:^{
                    NSMutableArray *objArray = [[NSMutableArray alloc] init];
                    for (NSManagedObjectID *robjId in objectIdArray) {
                        [objArray addObject:[[CoreDataManager instance].mainObjectContext objectWithID:robjId]];
                    }
                    if (resultBlock) {
                        resultBlock([objArray copy], nil);
                    }
                }];
            }
            
        }else{
            resultBlock(nil, nil);
        }
    }];
}

@end
