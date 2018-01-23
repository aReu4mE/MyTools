//
//  UIButton+ZCExtension.h
//  aReuTools
//
//  Created by aReu on 2018/1/10.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton(ZCExtension)



@end



/**
 The current category is to change the picture on the button and the text position
 */
@interface UIButton(ZCRectLayout)

///<#name#>
@property (assign, nonatomic) CGRect titleRect;
///<#name#>
@property (assign, nonatomic) CGRect imageRect;

@end
