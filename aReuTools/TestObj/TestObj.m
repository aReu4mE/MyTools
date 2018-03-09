//
//  TestObj.m
//  aReuTools
//
//  Created by aReu on 2018/1/3.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import "TestObj.h"
#import "GodObj.h"

@interface TestObj ()

///<#name#>
@property (strong, nonatomic) id objTarget;

@end

@implementation TestObj

- (void)setForwardTarget:(id)obj
{
    self.objTarget = obj;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    SEL sel = invocation.selector;
    NSString *selName = NSStringFromSelector(sel);
//    NSLog(@"%@,+++++%@",invocation.target,selName);
    
    if (_objTarget) {
        [invocation invokeWithTarget:self.objTarget];
    }else{
        [invocation invokeWithTarget:self];
    }
}

- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    if (_objTarget) {
        return [self.objTarget methodSignatureForSelector:sel];
    }else{
        return [self methodSignatureForSelector:sel];
    }
}

@end
