//
//  UIView+ZCLoadNib.h
//  aReuTools
//
//  Created by aReu on 2017/12/28.
//  Copyright © 2017年 aReu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(ZCLoadNib)

/**
 <#Description#>

 @return Returns an object with a Xib view, or null if it does not exist
 */
+ (id)zcLoadViewFromNib;


/**
 Initialize and reuse parent view methods.In particular, you can not get internal member properties.

 @return If the parent class view does not exist xib or xib exists in the current class view, it returns a null object
 */
- (id)initWithParentView;

@end
