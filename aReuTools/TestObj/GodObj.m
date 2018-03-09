//
//  GodObj.m
//  aReuTools
//
//  Created by aReu on 2018/1/18.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import "GodObj.h"

@implementation GodObj

- (id)copyWithZone:(nullable NSZone *)zone
{
    GodObj *obj = [[[self class] allocWithZone:zone] init];
    obj.str1 = [self.str1 copy];
    obj.isEat = self.isEat;
    return obj;
}

- (id)mutableCopyWithZone:(nullable NSZone *)zone
{
    GodObj *obj = [[[self class] allocWithZone:zone] init];
    obj.str1 = [self.str1 mutableCopy];
    obj.isEat = self.isEat;
    return obj;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.str1 = [aDecoder decodeObjectForKey:@"string"];
        self.isEat = [aDecoder decodeBoolForKey:@"eat"];
        if (_messageBlock) {
            self.messageBlock();
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.str1 forKey:@"string"];
    [aCoder encodeBool:self.isEat forKey:@"eat"];
}

- (void)test:(NSString *)str1 andStr2:(NSString *)str2 andStr3:(NSString *)str3;
{
    NSLog(@"你妹啊！ %@ %@ %@",str1,str2,str3);
}

@end
