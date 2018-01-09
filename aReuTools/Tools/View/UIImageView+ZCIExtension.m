//
//  UIImageView+ZCIExtension.m
//  aReuTools
//
//  Created by aReu on 2018/1/5.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import "UIImageView+ZCIExtension.h"
#import "UIView+ZCExtension.m"

@implementation UIImageView(ZCIExtension)

- (UIImageView *)setImageCorner:(CGFloat)radius
{
    //TODO异步绘制
    UIGraphicsBeginImageContextWithOptions(self.zc_size, NO, 0.0);
    CGContextAddPath(UIGraphicsGetCurrentContext(), [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawRect:self.bounds];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return self;
}

@end
