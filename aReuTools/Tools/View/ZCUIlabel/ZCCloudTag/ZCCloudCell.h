//
//  ZCCloudCell.h
//  aReuTools
//
//  Created by aReu on 2018/1/26.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString * const CloudPlaceholder;

typedef NS_ENUM(NSInteger,CloudCellType)
{
    CloudCellTypeRound = 10,//半圆
    CloudCellTypeRectangle,//矩形
    CloudCellTypeOnlyTitle,//出文字无边框
};

//typedef NS_ENUM(NSInteger,CloudCellSelectType)
//{
//    CloudCellSelectTypeNormal = 101,
//    CloudCellSelectTypeHighlight,
//    CloudCellSelectTypeFillHighlight
//};

@class ZCCloudTagModel;
@interface ZCCloudCell : UICollectionViewCell

@property (assign, nonatomic) CloudCellType cellType;

@property (strong, nonatomic) ZCCloudTagModel *model;

@property (strong, nonatomic,readonly) UILabel *textLabel;
///<#name#>
@property (strong, nonatomic) UIColor *borderColor;

@property (copy, nonatomic) void(^deleCellHandler)(void);

@end

/**
 额外添加的cell 方便在最后输入
 */
@interface ZCCloudTFCell : UICollectionViewCell

@property (strong, nonatomic,readonly) UITextField  *cloudTagTextfield;

@property (copy, nonatomic) void(^addCellHandler)(ZCCloudTagModel *model);

@end


