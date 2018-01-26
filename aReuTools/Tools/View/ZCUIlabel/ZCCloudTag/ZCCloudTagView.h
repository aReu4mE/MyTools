//
//  ZCCloudTagView.h
//  aReuTools
//
//  Created by aReu on 2018/1/26.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCCloudCell.h"

@class ZCCloudTagModel;
@interface ZCCloudTagView : UICollectionView

///<#name#>
@property (copy, nonatomic) NSArray<ZCCloudTagModel *> *zcCloudTagArr;
///<#name#>
@property (assign, nonatomic) CloudCellType zcCellType;

@end
