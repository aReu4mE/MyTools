//
//  ZCDataBase.m
//  aReuTools
//
//  Created by aReu on 2018/2/7.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import "ZCDataBase.h"
#import <objc/runtime.h>
#import <sqlite3.h>
#import "ZCResultSet.h"

@interface ZCDataBase ()
{
    void *_db;
    BOOL                _isExecutingStatement;
    NSTimeInterval      _startBusyRetryTime;
    NSMutableSet        *_openResultSets;
    NSMutableSet        *_openFunctions;
    NSDateFormatter     *_dateFormat;
}
@end

@implementation ZCDataBase

- (void)dealloc
{
    //clear dealloc
}

+(instancetype _Nullable )databaseWithPath:(NSString * _Nullable)path
{
    return [[self alloc] initWithPath:path];
}

+(instancetype _Nullable )databaseWithURL:(NSURL * _Nullable)url
{
    return [[self alloc] initWithPath:url.path];
}

- (instancetype)initWithPath:(NSString *)path
{
    assert(sqlite3_threadsafe());
    if (self = [self init]) {
        _databasePath   = [path copy];
        _openResultSets = [[NSMutableSet alloc] init];
        _db             = nil;
        _logsErrors     = YES;
        _crashOnErrors  = YES;
        _isOpen         = NO;
    }
    return self;
}

- (const char *)sqlitePath
{
    if (!_databasePath){
        return ":memory:";
    }
    return [_databasePath fileSystemRepresentation];
}

- (BOOL)open
{
    if (_isOpen) {
        return YES;
    }
    if (_db) {
        [self close];
    }
    int err = sqlite3_open([self sqlitePath], (sqlite3**)_db);
    if (err != SQLITE_OK) {
        NSLog(@"error opening!!");
        return NO;
    }
    return YES;
}


- (BOOL)close
{
    [self clearCacheStatements];
    [self closeOpenResultSets];
    
    if (!_db) {
        return YES;
    }
    
    int rc;
    BOOL retry;
    BOOL triedFinalizingOpenStatements = NO;
    
    do{
        retry = NO;
        rc = sqlite3_close(_db);
        if (SQLITE_BUSY == rc || SQLITE_LOCKED == rc) {
            if(!triedFinalizingOpenStatements){
                triedFinalizingOpenStatements = YES;
                sqlite3_stmt *pStmt;
#warning 只处理最后的一个？
                while ((pStmt = sqlite3_next_stmt(_db, nil)) != 0) {
                    NSLog(@"Closing leaked statement");
                    sqlite3_finalize(pStmt);
                    retry = YES;
                }
            }
        }else if (SQLITE_OK != rc){
            NSLog(@"error closing!:%d",rc);
        }
    } while (retry);
    
    _db     = nil;
    _isOpen = NO;
    return YES;
}

#pragma mark - <#arguments#>
- (void)closeOpenResultSets
{
#warning 为何要突然copy 但是只删除旧的？
    NSSet *openSetCopy = [_openResultSets copy];
    for (NSValue *rsInWrappedInAtastyValueMeal in openSetCopy) {
        ZCResultSet *rs = (ZCResultSet *)rsInWrappedInAtastyValueMeal;
        rs.parentDB = nil;
        [rs close];
        [_openResultSets removeObject:rs];
    }
}

#pragma mark - 关闭缓存状态
- (void)clearCacheStatements
{
    for (NSMutableSet *statements in [_cacheStatements objectEnumerator]) {
        for (FMStatement *stament in [statements allObjects]) {
            [stament close];
        }
    }
    [_cacheStatements removeAllObjects];
}

#pragma mark - 查询对应的缓存？？？？
- (FMStatement *)cachedStatementForQuery:(NSString *)query
{
    //dic
    NSMutableSet *statements = [_cacheStatements objectForKey:query];
    return [[statements objectsPassingTest:^BOOL(FMStatement *obj, BOOL * _Nonnull stop) {
        *stop = ![obj inUse];
        return *stop;
    }] anyObject];
}






@end
