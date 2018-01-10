//
//  UIImage+ZCIExtension.h
//  aReuTools
//
//  Created by aReu on 2018/1/5.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(ZCIExtension)

/**
 Picture cut round method

 @param radius <#radius description#>
 @return New after cutting the picture
 */
- (UIImage *)zCSetImageCorner:(CGFloat)radius;


/**
 Cut the picture method, the default diameter of the circle is half the height of the Image

 @return New after cutting the picture
 */
- (UIImage *)zCSetImageCorner;

@end
