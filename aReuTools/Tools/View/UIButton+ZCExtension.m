//
//  UIButton+ZCExtension.m
//  aReuTools
//
//  Created by aReu on 2018/1/10.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import "UIButton+ZCExtension.h"
#import "UIView+ZCExtension.h"
#include <objc/runtime.h>

@implementation UIButton(ZCExtension)

///exchange for initfial Method
//- (void)load
//{
//    Method initialMethod = class_getClassMethod([self class], @selector(initWithCoder:));
//    Method newMethod = class_getClassMethod([self class], @selector(initWithZCBtn:));
//    method_exchangeImplementations(initialMethod, newMethod);
//}

//- (id)initWithZCBtn:(NSCoder *)aDecoder
//{
//    self = [self initWithZCBtn:aDecoder];
//    if (self) {
//        NSDictionary *dic = @{NSFontAttributeName:@12};
////        CGSize size = self.titleLabel.zc_size;
//        [self.titleLabel.text boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
//    }
//    return self;
//}

@end
