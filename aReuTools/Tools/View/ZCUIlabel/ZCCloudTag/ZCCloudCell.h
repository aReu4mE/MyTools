//
//  ZCCloudCell.h
//  aReuTools
//
//  Created by aReu on 2018/1/26.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,CloudCellType)
{
    CloudCellTypeRound,//半圆
    CloudCellTypeRectangle,//矩形
    CloudCellTypeOnlyTitle,//出文字无边框
};

typedef NS_ENUM(NSInteger,CloudCellSelectType)
{
    CloudCellSelectTypeNormal,
    CloudCellSelectTypeHighlight,
    CloudCellSelectTypeFillHighlight
};

@interface ZCCloudCell : UICollectionViewCell

///<#name#>
@property (assign, nonatomic) CloudCellType cellType;
///<#name#>
@property (assign, nonatomic) CloudCellSelectType selectType;

@end


/**
 额外添加的cell 方便在最后输入
 */
@interface ZCCloudTFCell : UICollectionViewCell

@end


