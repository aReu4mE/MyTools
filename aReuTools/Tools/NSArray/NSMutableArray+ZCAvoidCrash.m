//
//  NSMutableArray+ZCAvoidCrash.m
//  aReuTools
//
//  Created by aReu on 2017/12/24.
//  Copyright © 2017年 aReu. All rights reserved.
//

#import "NSMutableArray+ZCAvoidCrash.h"

@implementation NSMutableArray (ZCAvoidCrash)

- (nullable id)zcObjectAtIndex:(NSUInteger)index
{
    NSUInteger count = self.count;
    if (index >= count) {
        return nil;
    }
    return [self objectAtIndex:index];
}

- (void)zcRemoveObjectAtIndex:(NSUInteger)index
{
    NSUInteger count = self.count;
    if (index >= count) {
        return;
    }
    [self removeObjectAtIndex:index];
}

- (void)zcInsertObject:(nonnull id)anObject atIndex:(NSUInteger)index
{
    NSUInteger count = self.count;
    if (index > count) {
        return;
    }
    if (!anObject) {
        return;
    }
    [self insertObject:anObject atIndex:index];
}

- (void)zcAddObject:(nonnull id)anObject{
    if (!anObject) {
        return;
    }
    [self addObject:anObject];
}


@end
