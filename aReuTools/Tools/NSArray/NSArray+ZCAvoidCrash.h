//
//  NSArray+ZCAvoidCrash.h
//  aReuTools
//
//  Created by aReu on 2017/12/28.
//  Copyright © 2017年 aReu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ZCAvoidCrash)

- (nullable id)zcObjectAtIndex:(NSUInteger)idx;

- (nullable NSArray *)zcObjectsAtIndexes:(nonnull NSIndexSet *)indexes;

- (nullable NSArray *)zcArrayByAddingObject:(nonnull id)anObject;

@end
