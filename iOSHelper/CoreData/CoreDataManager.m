//
//  CoreDataManager.m
//  AiGuoZhe
//
//  Created by Aigo on 14-7-10.
//  Copyright (c) 2014年 Tang silence. All rights reserved.
//

#import "CoreDataManager.h"

static CoreDataManager *onlyInstance;

@interface CoreDataManager ()
@property (nonatomic, copy)NSString *modelName;
@property (nonatomic, copy)NSString *dbFileName;
@end

@implementation CoreDataManager


static CoreDataManager *manager;

+(CoreDataManager *)instance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        onlyInstance = [[CoreDataManager alloc] init];
    });
    return onlyInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void) setupEnvModel:(NSString *)model DbFile:(NSString*)filename{
    _modelName = model;
    _dbFileName = filename;
    [self initCoreDataStack];
}

- (void)initCoreDataStack
{
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _bgObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        [_bgObjectContext setPersistentStoreCoordinator:coordinator];
        
        _mainObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_mainObjectContext setParentContext:_bgObjectContext];
    }
    
}


- (NSManagedObjectContext *)createPrivateObjectContext
{
    NSManagedObjectContext *ctx = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    [ctx setParentContext:_mainObjectContext];
    
    return ctx;
}


- (NSManagedObjectModel *)managedObjectModel
{
    NSManagedObjectModel *managedObjectModel;
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:_modelName withExtension:@"momd"];
    managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    NSPersistentStoreCoordinator *persistentStoreCoordinator = nil;
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:_dbFileName];
    
    NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    return persistentStoreCoordinator;
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


-(NSError*)save:(OperationResult)handler{
    NSError *error;
    if ([_mainObjectContext hasChanges]) {
        [_mainObjectContext save:&error];
        [_bgObjectContext performBlock:^{
            __block NSError *inner_error = nil;
            [_bgObjectContext save:&inner_error];
            if (handler){
                [_mainObjectContext performBlock:^{
                    handler(error);
                }];
            }
        }];
    }
    return error;
}


#pragma mark - function
//- (void)saveContext
//{
//    NSError *error = nil;
//    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
//    if (managedObjectContext != nil) {
//        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
//            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//            abort();
//        }
//    }
//}
//
//
//- (NSURL *)applicationDocumentsDirectory
//{
//    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
//}
@end
