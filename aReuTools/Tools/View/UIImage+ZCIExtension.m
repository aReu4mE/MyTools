//
//  UIImage+ZCIExtension.m
//  aReuTools
//
//  Created by aReu on 2018/1/5.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import "UIImage+ZCIExtension.h"
#import "UIView+ZCExtension.h"

@implementation UIImage(ZCIExtension)

- (UIImage *)zCSetImageCorner:(CGFloat)radius
{
    //TODO异步绘制
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    CGContextAddPath(UIGraphicsGetCurrentContext(), [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:rect];
    UIImage *cornerImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return cornerImage;
}

- (UIImage *)zCSetImageCorner
{
    return [self zCSetImageCorner:self.size.height/2.0];
}

@end
