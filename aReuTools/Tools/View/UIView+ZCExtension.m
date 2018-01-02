//
//  UIView+ZCExtension.m
//  aReuTools
//
//  Created by aReu on 2018/1/2.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import "UIView+ZCExtension.h"

@implementation UIView(ZCExtension)

- (void)setZc_x:(CGFloat)zc_x
{
    CGRect rect   = self.frame;
    rect.origin.x = zc_x;
    self.frame    = rect;
}

- (CGFloat)zc_x
{
    return self.frame.origin.x;
}

- (void)setZc_y:(CGFloat)zc_y
{
    CGRect rect   = self.frame;
    rect.origin.y = zc_y;
    self.frame    = rect;
}

- (CGFloat)zc_y
{
    return self.frame.origin.y;
}

- (void)setZc_centerX:(CGFloat)zc_centerX
{
    CGPoint size = self.center;
    size.x       = zc_centerX;
    self.center  = size;
}

- (CGFloat)zc_centerX
{
    return self.center.x;
}

- (void)setZc_centerY:(CGFloat)zc_centerY
{
    CGPoint point = self.center;
    point.y       = zc_centerY;
    self.center   = point;
}

- (CGFloat)zc_centerY
{
    return self.center.y;
}

- (void)setZc_right:(CGFloat)zc_right
{
    CGRect rect   = self.frame;
    rect.origin.x = zc_right - rect.size.width;
    self.frame    = rect;
}

- (CGFloat)zc_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setZc_bottom:(CGFloat)zc_bottom
{
    CGRect rect = self.frame;
    rect.origin.y = zc_bottom - rect.size.height;
    self.frame = rect;
}

- (CGFloat)zc_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}


- (void)clearAllSubViews
{
    if (self.subviews.count > 0) {
        for (UIView *subView in self.subviews) {
            [subView removeFromSuperview];
        }
    }
}

@end
