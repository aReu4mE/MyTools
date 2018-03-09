//
//  ZCTestButton+Extension.m
//  aReuTools
//
//  Created by aReu on 2018/1/24.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import "ZCTestButton+Extension.h"
#include <objc/runtime.h>

//const void *imageRectKey1 = @"imageRect";

@implementation ZCTestButton(Extension)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //注意这里，如果添加的是类方法的替换,则需要在meta类中添加，另外下文中的class_getInstanceMethod也要替换成获取类方法模式！！！！
        zcMethodSwizzle1(object_getClass(self), @selector(test), @selector(zcImageRectForContentRect:));
    });
}

void zcMethodSwizzle1(Class cls, SEL exitSel, SEL overrideSel)
{
    Method exitMethod = class_getInstanceMethod(cls, exitSel);
    Method overrideMethod = class_getInstanceMethod(cls, overrideSel);
    //if method has existed in current class,return no
    //子类没有实现父类的方法，因此在这里添加一个（超类）父类选择器(函数指针)的imp实现，那么添加之后，还不会替换掉当前类的实现方法，那么为了使我们的方法能替换掉超类的实现，用本地的函数指针替换掉（交换）本地新的imp实现。
    //ps:IMP The new implementation for the method identified by name for the class identified by cls.当前新生成的实现方。
    //创建一个超类的实现到这个函数指针中(exitsel)进行保存。 ture后 replace方法让新的sel取得旧的Method，从而反向调用。
    if(class_addMethod(cls, exitSel, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod))){
        class_replaceMethod(cls, overrideSel, method_getImplementation(exitMethod), method_getTypeEncoding(exitMethod));
    }else{
        method_exchangeImplementations(exitMethod, overrideMethod);
    }
    
    // 子 selector+  超累实现,但是不覆盖原来的实现，
    // selcrtor的实现 赋予父的
}

//- (void)setImageRect:(CGRect)imageRect
//{
//    objc_setAssociatedObject(self, @"123", [NSValue valueWithCGRect:imageRect], OBJC_ASSOCIATION_RETAIN);
//}
//
//- (CGRect)imageRect
//{
//    return [objc_getAssociatedObject(self, @"123") CGRectValue];
//}
//
//- (CGRect)zcImageRectForContentRect:(CGRect)contentRect
//{
//    if (![self isZero:self.imageRect]) {
//        return [self zcImageRectForContentRect:self.imageRect];
//    }
//    return [self zcImageRectForContentRect:contentRect];
//}

//- (BOOL)isZero:(CGRect)rect
//{
//    return CGRectEqualToRect(rect, CGRectZero);
//}

@end
