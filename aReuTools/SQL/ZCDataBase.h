//
//  ZCDataBase.h
//  aReuTools
//
//  Created by aReu on 2018/2/7.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSInteger(^ZCExcuteStatementBlock)(NSDictionary *results);

//typedef NS_ENUM(NSInteger,ZCCheckPointModel)
//{
//
//};

@interface ZCDataBase : NSObject

///跟踪执行
@property (assign) BOOL traceExcution;
///<#name#>
@property (assign) BOOL checkOut;
///<#name#>
@property (assign) BOOL crashOnErrors;
///<#name#>
@property (assign) BOOL logsErrors;
///<#name#>
@property (strong,nullable) NSMutableDictionary *cacheStatements;
/** The path of the database file
 */
@property (nonatomic, readonly, nullable) NSString *databasePath;
/** The file URL of the database file.
 */
@property (nonatomic, readonly, nullable) NSURL *databaseURL;
/** Whether database has any open result sets
 
 @return `YES` if there are open result sets; `NO` if not.
 */
@property (nonatomic, readonly) BOOL hasOpenResultSets;
/** Whether should cache statements or not
 */
@property (nonatomic) BOOL shouldCacheStatements;


///why 使用非原子性??
@property (assign, nonatomic) BOOL isOpen;
///<#name#>
@property (assign, nonatomic,readonly) BOOL goodConnection;

+(instancetype _Nullable )databaseWithPath:(NSString * _Nullable)path;

+(instancetype _Nullable )databaseWithURL:(NSURL * _Nullable)url;

- (BOOL)open;

- (BOOL)close;

@end









@interface FMStatement : NSObject {
    void *_statement;
    NSString *_query;
    long _useCount;
    BOOL _inUse;
}

///-----------------
/// @name Properties
///-----------------

/** Usage count */

@property (atomic, assign) long useCount;

/** SQL statement */

@property (atomic, retain) NSString *query;

/** SQLite sqlite3_stmt
 
 @see [`sqlite3_stmt`](http://www.sqlite.org/c3ref/stmt.html)
 */

@property (atomic, assign) void *statement;

/** Indication of whether the statement is in use */

@property (atomic, assign) BOOL inUse;

///----------------------------
/// @name Closing and Resetting
///----------------------------

/** Close statement */

- (void)close;

/** Reset statement */

- (void)reset;

@end
