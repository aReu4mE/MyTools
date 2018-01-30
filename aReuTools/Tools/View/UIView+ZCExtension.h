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

@property (assign, nonatomic) CGSize  zc_size;

/**
 Remove all subView on the current view
 */
- (void)clearAllSubViews;

@end

@interface UIView (ZCRoundCorner)

/**
 The current control's default setting is half the height of the corner, without the width and color of the border
 */
-(void)setDefaultCorner;

/**
 Custom view method, do not set the border width defaults to 1pt, the same border color defaults to the background color

 @param cornerRadius cornerRadius
 @param width borderWidth
 @param color borderColor
 */
-(void)setCorner:(CGFloat)cornerRadius
     borderWidth:(CGFloat)width
     borderColor:(UIColor*)color;


/**
 remove all sublayer in the current view's layer
 */
- (void)removeAllSubLayer;
@end

