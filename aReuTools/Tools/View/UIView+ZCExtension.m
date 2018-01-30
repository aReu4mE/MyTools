//
//  UIView+ZCExtension.m
//  aReuTools
//
//  Created by aReu on 2018/1/2.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import "UIView+ZCExtension.h"
#import <CoreGraphics/CoreGraphics.h>

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
    CGRect rect   = self.frame;
    rect.origin.y = zc_bottom - rect.size.height;
    self.frame    = rect;
}

- (CGFloat)zc_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setZc_width:(CGFloat)zc_width
{
    CGRect rect     = self.frame;
    rect.size.width = zc_width;
    self.frame      = rect;
}

- (CGFloat)zc_width
{
    return self.frame.size.width;
}

- (void)setZc_height:(CGFloat)zc_height
{
    CGRect rect      = self.frame;
    rect.size.height = zc_height;
    self.frame       = rect;
}

- (CGFloat)zc_height
{
    return self.frame.size.height;
}

- (void)setZc_size:(CGSize)zc_size
{
    CGRect rect = self.frame;
    rect.size   = zc_size;
    self.frame  = rect;
}

- (CGSize)zc_size
{
    return self.frame.size;
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

@implementation UIView (ZCRoundCorner)

-(void)setDefaultCorner
{
    [self customSetCorner:self.zc_height/2.0 borderWidth:0 borderColor:nil];
}

-(void)setCorner:(CGFloat)cornerRadius
     borderWidth:(CGFloat)width
     borderColor:(UIColor*)color
{
    [self customSetCorner:cornerRadius
              borderWidth:width
              borderColor:color];
}

//TODO 后续添加单个位置圆角设置,后续按需求进行优化
- (void)customSetCorner:(CGFloat)cornerRadius
            borderWidth:(CGFloat)width
            borderColor:(UIColor*)color
{
    UIBezierPath *path  = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                     cornerRadius:cornerRadius];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.frame         = self.bounds;
    layer.path          = path.CGPath;
    if (color) {
        layer.strokeColor   = color.CGColor;
    }
    layer.fillColor = [UIColor clearColor].CGColor;
    [self removeAllSubLayer];
    [self.layer addSublayer:layer];
}

- (void)removeAllSubLayer
{
    for (CALayer *layer in self.layer.sublayers) {
        [layer removeFromSuperlayer];
    }
}


@end
