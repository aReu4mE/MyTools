//
//  ZCTrotHorseLabel.h
//  aReuTools
//
//  Created by aReu on 2018/1/15.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import <UIKit/UIKit.h>

/* The name of the transition. Current legal transition types include
 * `fade', `moveIn', `push' and `reveal'. Defaults to `fade'. */
typedef NS_ENUM(NSInteger,ZCTrotHorseType)
{
    ZCTrotHorseTypeFade,
    ZCTrotHorseTypeMoveIn,
    ZCTrotHorseTypePush,
    ZCTrotHorseTypeReveal,
    ZCTrotHorseTypeCube,
    ZCTrotHorseTypePageCurl,
    ZCTrotHorseTypeoglFlip,
    ZCTrotHorseTypeSuckEffect,
    ZCTrotHorseTypeRippleEffect,
    ZCTrotHorseTypeCameraHollowOpen,
    ZCTrotHorseTypeCameraHollowClose
};

/* An optional subtype for the transition. E.g. used to specify the
 * transition direction for motion-based transitions, in which case
 * the legal values are `fromLeft', `fromRight', `fromTop' and
 * `fromBottom'. */
typedef NS_ENUM(NSInteger,ZCDirection)
{
    ZCDirectionFromLeft,
    ZCDirectionFromRight,
    ZCDirectionFromTop,
    ZCDirectionFromBottom
};

@interface ZCTrotHorseLabel : UIView
///arr of trot texts
@property (copy, nonatomic) NSArray <NSString *> *trotTextsArr;
///animation interval, the default 2 seconds
@property (assign, nonatomic) NSTimeInterval intervalTime;
///
@property (strong, nonatomic,readonly) UILabel *trotLabel;
///The location where the initial animation is displayed
@property (assign, nonatomic) ZCDirection directionType;
///Marquee display
@property (assign, nonatomic) ZCTrotHorseType trotType;

@property (copy, nonatomic) void(^trotLabelHandler)(NSInteger index,NSString *displayText);

- (instancetype)initWithFrame:(CGRect)frame
                    trotTexts:(NSArray <NSString *> *)texts
                trotHorseType:(ZCTrotHorseType)type;

- (void)startTrotting;

- (void)stopTrotting;

@end
