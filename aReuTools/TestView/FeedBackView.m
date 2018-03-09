//
//  FeedBackView.m
//
//
//  Created by aReu on 2017/10/10.
//  Copyright © 2017年 aReu. All rights reserved.
//

#import "FeedBackView.h"

@interface FeedBackView ()


@property (strong, nonatomic) NSMutableArray<NSString *> *tagArr;
@end

@implementation FeedBackView

- (void)awakeFromNib
{
    [super awakeFromNib];
    _btn1.backgroundColor = [UIColor redColor];
    self.tagArr = [[NSMutableArray alloc] initWithCapacity:4];
}

- (IBAction)chooseActions:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    NSString *str = sender.titleLabel.text;
    if (sender.selected && ![self.tagArr containsObject:str]) {
        [self.tagArr addObject:str];
    }
    if (!sender.selected && [self.tagArr containsObject:str]) {
        [self.tagArr removeObject:str];
    }
    [self refreshBtnState];
}


- (void)refreshBtnState
{
//    NSArray<UIButton *> *arr = @[_btn1,_btn2,_btn3,_btn4];
//    for (UIButton *temp in arr) {
//        if ([self.tagArr containsObject:temp.titleLabel.text]){
//            [temp setCorner:10.0f borderWidth:borderwidth borderColor:ZCTextHighColor];
//            [temp setTitleColor:ZCTextLightBlackColor forState:UIControlStateSelected];
//        }else{
//            [temp setCorner:10.0f borderWidth:borderwidth borderColor:ZCTextLightBlackColor];
//        }
//    }
}

- (IBAction)confirmAction:(UIButton *)sender
{
    
    if (_block) {
        self.block();
    }
}

- (void)clearAllStatus
{
//    [self.btn1 setCorner:10.0f borderWidth:borderwidth borderColor:ZCTextLightBlackColor];
//    [self.btn2 setCorner:10.0f borderWidth:borderwidth borderColor:ZCTextLightBlackColor];
//    [self.btn3 setCorner:10.0f borderWidth:borderwidth borderColor:ZCTextLightBlackColor];
//    [self.btn4 setCorner:10.0f borderWidth:borderwidth borderColor:ZCTextLightBlackColor];
//    [self.textView setCorner:10.0f borderWidth:borderwidth borderColor:ZCTextLightBlackColor];
//    [self.confirmBtn setCorner:10.0f];
//    [self.tagArr removeAllObjects];
//    self.textView.text = @"";
}



@end
