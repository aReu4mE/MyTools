//
//  NSArray+ZCAvoidCrash.m
//  aReuTools
//
//  Created by aReu on 2017/12/28.
//  Copyright © 2017年 aReu. All rights reserved.
//

#import "NSArray+ZCAvoidCrash.h"

@implementation NSArray (ZCAvoidCrash)

- (nullable id)zcObjectAtIndex:(NSUInteger)idx
{
    NSUInteger count = self.count;
    if (idx >= count) {
        return nil;
    }
    return [self objectAtIndex:idx];
}

- (nullable NSArray *)zcObjectsAtIndexes:(nonnull NSIndexSet *)indexes
{
    NSUInteger count = self.count;
    if (indexes.lastIndex >= count || indexes.lastIndex >= count){
        return nil;
    }
    return [self objectsAtIndexes:indexes];
}

- (nullable NSArray *)zcArrayByAddingObject:(nonnull id)anObject
{
    if (!anObject) {
        return nil;
    }
    return [self arrayByAddingObject:anObject];
}

@end
