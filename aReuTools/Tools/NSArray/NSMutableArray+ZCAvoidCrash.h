//
//  NSMutableArray+ZCAvoidCrash.h
//  aReuTools
//
//  Created by aReu on 2017/12/24.
//  Copyright © 2017年 aReu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (ZCAvoidCrash)

- (nullable id)zcObjectAtIndex:(NSUInteger)index;

- (void)zcRemoveObjectAtIndex:(NSUInteger)index;

- (void)zcInsertObject:(nonnull id)anObject
               atIndex:(NSUInteger)index;

- (void)zcAddObject:(nonnull id)anObject;
@end
