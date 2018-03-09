//
//  UIView+ZCLoadNib.m
//  aReuTools
//
//  Created by aReu on 2017/12/28.
//  Copyright © 2017年 aReu. All rights reserved.
//

#import "UIView+ZCLoadNib.h"
#include <objc/runtime.h>

#define isContainNibPath(aClass)  ([[NSBundle mainBundle] pathForResource:NSStringFromClass(aClass)\
                        ofType:@"nib"].length > 0)
@implementation UIView(ZCLoadNib)

+ (id)zcLoadViewFromNib
{
    if(isContainNibPath([self class])) {
        id nibObj = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                   owner:self
                                                 options:nil] lastObject];
        return nibObj;
    }
    return nil;
}

- (id)initWithParentView
{
    Class parentClass = self.superclass;
    //If the parent class view does not exist xib or xib exists in the current class view, it returns a null object
    if (isContainNibPath([self class]) || (!isContainNibPath(parentClass))) return nil;
    
    if(isContainNibPath(parentClass)) {
        self = [self init];
        UIView *parentView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(parentClass) owner:self options:nil] lastObject];
        parentView.frame   = self.bounds;
        [self addSubview:parentView];

        unsigned int num = 0;
        objc_property_t *list = class_copyPropertyList(parentClass, &num);
        for (NSInteger i = 0; i < num; i++) {
            objc_property_t property = list[i];
            NSString *propertyName   =  [NSString stringWithCString :property_getName(property) encoding :NSUTF8StringEncoding];
            id subVar = [parentView valueForKey:propertyName];
            [self setValue:subVar forKey:propertyName];
#warning 为何block无法使用
        }
        free(list);
        //
        unsigned int num1 = 0;
        Method *methodList = class_copyMethodList(parentClass, &num);
        for (NSInteger i = 0; i < num1; i++) {
            Method method        = methodList[i];
            NSString *methodName = [NSString stringWithCString : sel_getName(method_getName(method)) encoding :NSUTF8StringEncoding];
            [self setValue:[parentView valueForKey:methodName] forKey:methodName];
        }
        free(methodList);
        return self;
    }
    return nil;
}

@end
