//
//  UIView+ZCExtension.h
//  aReuTools
//
//  Created by aReu on 2018/1/2.
//  Copyright © 2018年 aReu. All rights reserved.
//  Conventional value

#import <UIKit/UIKit.h>

@interface UIView(ZCExtension)

@property (assign, nonatomic) CGFloat zc_x;

@property (assign, nonatomic) CGFloat zc_y;

@property (assign, nonatomic) CGFloat zc_width;

@property (assign, nonatomic) CGFloat zc_height;

@property (assign, nonatomic) CGFloat zc_centerX;

@property (assign, nonatomic) CGFloat zc_centerY;

@property (assign, nonatomic) CGFloat zc_right;

@property (assign, nonatomic) CGFloat zc_bottom;

- (void)clearAllSubViews;
@end
