//
//  ZCCloudTagView.h
//  aReuTools
//
//  Created by aReu on 2018/1/26.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCCloudCell.h"

@interface ZCCloudTagView : UICollectionView
///
@property (assign, nonatomic) BOOL zcScrollEnabled;
///<#name#>
@property (assign, nonatomic) BOOL zcMutSel;
///<#name#>
@property (copy, nonatomic) NSArray *zcCloudTagArr;
///<#name#>
@property (assign, nonatomic) CloudCellType zcCellType;
@end
