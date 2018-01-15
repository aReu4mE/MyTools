//
//  ZCTrotHorseLabel.m
//  aReuTools
//
//  Created by aReu on 2018/1/15.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import "ZCTrotHorseLabel.h"
#import <QuartzCore/QuartzCore.h>
#import "UIView+ZCExtension.h"

@interface ZCTrotHorseLabel ()
///<#name#>
@property (strong, nonatomic) UILabel *trotLabel;
///current display index
@property (assign, nonatomic) NSInteger index;
@end

@implementation ZCTrotHorseLabel

- (instancetype)initWithFrame:(CGRect)frame
                    trotTexts:(NSArray <NSString *> *)textsArr
                trotHorseType:(ZCTrotHorseType)type
{
    if (self = [super initWithFrame:frame]) {
        self.trotTextsArr = textsArr;
        self.trotType     = type;
        [self initSetting];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initSetting];
}

- (void)initSetting
{
    self.index = 0;
    self.intervalTime = 3.5f;
    self.trotLabel = [[UILabel alloc] initWithFrame:self.frame];
    self.trotLabel.font = [UIFont systemFontOfSize:self.zc_height *0.45];
    self.trotLabel.textAlignment  = NSTextAlignmentCenter;
    self.trotLabel.textColor      = [UIColor blackColor];
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTrotLabel:)];
    [self.trotLabel addGestureRecognizer:tapGr];
    [self addSubview:self.trotLabel];
}

- (void)startTrotting
{
    if (self.index == self.trotTextsArr.count) {    //reset index
        self.index = 0;
    }
    [self.trotLabel.layer removeAnimationForKey:@"animation"];
    NSTimeInterval duration = .5f;
    CATransition *transion  = [CATransition new];
    transion.type     = [self getZCTrotHorseType:self.trotType];
    transion.subtype  = [self getZCDirection:self.directionType];
    transion.duration = duration;
    [self.trotLabel.layer addAnimation:transion forKey:@"animation"];
    //
    [UIView animateWithDuration:duration animations:^{
        self.trotLabel.text = self.trotTextsArr[self.index];
    }];
    self.index ++;
    [self performSelector:@selector(startTrotting) withObject:nil afterDelay:self.intervalTime];
}

- (void)stopTrotting
{
    [self.trotLabel.layer removeAnimationForKey:@"animation"];
    [ZCTrotHorseLabel cancelPreviousPerformRequestsWithTarget:self selector:@selector(startTrotting) object:nil];
}

- (void)tapTrotLabel:(UITapGestureRecognizer*)gr
{
    if (_trotLabelHandler) {
        self.trotLabelHandler(self.index,self.trotTextsArr[self.index]);
    }
}

#pragma mark - custom method
- (NSString *)getZCTrotHorseType:(ZCTrotHorseType) type
{
    NSString *str = nil;
    switch (type) {
        case ZCTrotHorseTypeFade:   str = kCATransitionFade; break;
        case ZCTrotHorseTypeMoveIn: str = kCATransitionMoveIn;break;
        case ZCTrotHorseTypePush:   str = kCATransitionPush; break;
        case ZCTrotHorseTypeReveal: str = kCATransitionReveal;break;
        case ZCTrotHorseTypeCube:   str = @"cube";break;
        case ZCTrotHorseTypePageCurl: str = @"pageCurl";break;
        case ZCTrotHorseTypeoglFlip:  str = @"oglFlip";break;
        case ZCTrotHorseTypeSuckEffect: str = @"suckEffect";break;
        case ZCTrotHorseTypeRippleEffect: str = @"rippleEffect";break;
        case ZCTrotHorseTypeCameraHollowOpen: str = @"cameraIrisHollowOpen";break;
        case ZCTrotHorseTypeCameraHollowClose: str = @"cameraIrisHollowClose";break;
        default: break;
    }
    return str;
}

- (NSString *)getZCDirection:(ZCDirection) type
{
    NSString *str = nil;
    switch (type) {
        case ZCDirectionFromLeft:   str = @"fromLeft"; break;
        case ZCDirectionFromRight:  str = @"fromRight";break;
        case ZCDirectionFromTop:    str = @"fromTop"; break;
        case ZCDirectionFromBottom: str = @"fromBottom";break;
        default: break;
    }
    return str;
}

@end
