//
//  CoreDataManager.h
//  AiGuoZhe
//
//  Created by Aigo on 14-7-10.
//  Copyright (c) 2014年 Tang silence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef void(^OperationResult)(NSError* error);

@interface CoreDataManager : NSObject
@property (readonly, strong, nonatomic) NSOperationQueue *queue;
@property (readonly ,strong, nonatomic) NSManagedObjectContext *bgObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectContext *mainObjectContext;

+(CoreDataManager *)instance;
-(void) setupEnvModel:(NSString *)model DbFile:(NSString*)filename;
- (NSManagedObjectContext *)createPrivateObjectContext;
-(NSError*)save:(OperationResult)handler;
@end
