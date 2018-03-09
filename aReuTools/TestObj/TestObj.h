//
//  TestObj.h
//  aReuTools
//
//  Created by aReu on 2018/1/3.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestObj : NSProxy

- (void)setForwardTarget:(id)obj;

@end
