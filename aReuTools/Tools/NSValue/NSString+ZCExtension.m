//
//  NSString+ZCExtension.m
//  aReuTools
//
//  Created by aReu on 2018/1/10.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import "NSString+ZCExtension.h"

@implementation NSString(ZCExtension)

+(NSString*)zCStringFromValue:(NSInteger)value
{
    return [NSString stringWithFormat:@"%ld",value];
}




@end
