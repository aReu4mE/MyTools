//
//  ZCResultSet.h
//  aReuTools
//
//  Created by aReu on 2018/2/7.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCDataBase.h"

@interface ZCResultSet : NSObject

///<#name#>
@property (strong,nullable) NSString *query;
///<#name#>
@property (strong,readonly,nullable) NSMutableDictionary * columnNameToIndexMap;
///<#name#>
@property (strong,nullable) FMStatement *statement;
///<#name#>
@property (assign, nonatomic,readonly) NSInteger columnCount;

@property (nonatomic, strong, nullable) ZCDataBase *parentDB;

+ (instancetype _Nullable)resultSetWithStatement:(FMStatement * _Nonnull)statement
                             usingParentDatabase:(ZCDataBase *_Nonnull)db;

- (void)close;

- (BOOL)next;

//- (BOOL)nextWithError:(NSError * *)error;

- (BOOL)hasAnotherRow;

- (NSInteger)columnIndexForName:(NSString *_Nullable)columnName;

- (NSString *_Nullable)columnNameForIndex:(NSInteger)columnInex;

- (BOOL)boolForColum:(NSString *_Nullable)columnName;

//- (NSString *_Nullable)columnNameForIndex:(NSInteger)columnInex;




@end
