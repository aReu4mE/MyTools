//
//  FeedBackView.h
//
//
//  Created by aReu on 2017/10/10.
//  Copyright © 2017年 aReu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^messageBlock)(void);
@interface FeedBackView : UIView

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

- (void)clearAllStatus;

@property (copy, nonatomic) messageBlock block;

@end
