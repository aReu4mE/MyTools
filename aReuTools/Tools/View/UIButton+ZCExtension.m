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

const void *imageRectKey = @"imageRect";
const void *titleRectKey = @"titleRect";

@implementation UIButton(ZCExtension)


@end

@implementation UIButton(ZCRectLayout)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        zcMethodSwizzle([self class], @selector(titleRectForContentRect:), @selector(zcTitleRectForContentRect:));
        zcMethodSwizzle([self class], @selector(imageRectForContentRect:), @selector(zcImageRectForContentRect:));
    });
}

void zcMethodSwizzle(Class cls, SEL exitSel, SEL overrideSel)
{
    Method oldMethod = class_getInstanceMethod(cls, exitSel);
    Method newMethod = class_getInstanceMethod(cls, overrideSel);
    //if method has existed in current class,return no
    if(class_addMethod(cls, exitSel, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))){
        class_replaceMethod(cls, overrideSel, method_getImplementation(oldMethod), method_getTypeEncoding(oldMethod));
    }else{
        method_exchangeImplementations(oldMethod, newMethod);
    }
}

- (void)setImageRect:(CGRect)imageRect
{
    objc_setAssociatedObject(self, imageRectKey, [NSValue valueWithCGRect:imageRect], OBJC_ASSOCIATION_RETAIN);
}

- (CGRect)imageRect
{
    return [objc_getAssociatedObject(self, imageRectKey) CGRectValue];
}

- (void)setTitleRect:(CGRect)titleRect
{
    objc_setAssociatedObject(self, titleRectKey, [NSValue valueWithCGRect:titleRect], OBJC_ASSOCIATION_RETAIN);
}

- (CGRect)titleRect
{
    return [objc_getAssociatedObject(self, titleRectKey) CGRectValue];
}

- (CGRect)zcTitleRectForContentRect:(CGRect)contentRect
{
    if (![self isZero:self.titleRect]) {
       return [self zcTitleRectForContentRect:self.titleRect];
    }
    return [self zcTitleRectForContentRect:contentRect];
}

- (CGRect)zcImageRectForContentRect:(CGRect)contentRect
{
    if (![self isZero:self.imageRect]) {
       return [self zcImageRectForContentRect:self.imageRect];
    }
    return [self zcImageRectForContentRect:contentRect];
}

- (BOOL)isZero:(CGRect)rect
{
    return CGRectEqualToRect(rect, CGRectZero);
}

@end
