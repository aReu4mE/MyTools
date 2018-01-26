//
//  ZCCloudTagView.m
//  aReuTools
//
//  Created by aReu on 2018/1/26.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import "ZCCloudTagView.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "ZCCloudCell.h"
#import "ZCCloudTagModel.h"
#import "NSArray+ZCAvoidCrash.h"
#import "UIView+ZCExtension.h"

const CGFloat itemIterval = 16.0f;
const CGFloat itemHeight = 25.0f;
const CGFloat lineSpacing = 12.0f;

@interface ZCCloudTagView ()<UICollectionViewDataSource,UIScrollViewDelegate,UICollectionViewDelegateLeftAlignedLayout>

//2.实现最后一位置为文本输入可编辑cell
//3.长按删除标签
@end

@implementation ZCCloudTagView


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (!layout) {
        layout = [[UICollectionViewLeftAlignedLayout alloc] init];
    }
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        [self inittSetting];
    }
    return self;
}

#pragma mark - initSetting
- (void)inittSetting
{
    self.zcCloudTagArr = @[];
    self.dataSource    = self;
    self.delegate      = self;
    self.backgroundColor = [UIColor clearColor];
    [self registerClass:[ZCCloudTFCell class] forCellWithReuseIdentifier:NSStringFromClass([ZCCloudTFCell class])];
    [self registerClass:[ZCCloudCell class] forCellWithReuseIdentifier:NSStringFromClass([ZCCloudCell class])];
    //default is NO
    self.allowsMultipleSelection = YES;
}

#pragma mark - UICollectionViewDelegateLeftAlignedLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.zcCloudTagArr.count) {
        ZCCloudTFCell *cell = (ZCCloudTFCell*)[collectionView cellForItemAtIndexPath:indexPath];
        CGSize tfSize = [cell.cloudTagTextfield.placeholder sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]}];
        return CGSizeMake((tfSize.width + itemIterval), itemHeight);;
    }
    
#warning 适配字体
    ZCCloudTagModel *model = (ZCCloudTagModel*)[self.zcCloudTagArr zcObjectAtIndex:indexPath.row];
    CGSize size = [model.cloudText sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]}];
    return CGSizeMake((size.width + itemIterval), itemHeight);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return lineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return lineSpacing;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(lineSpacing, lineSpacing, lineSpacing, lineSpacing);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.zcCloudTagArr.count + 1;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.zcCloudTagArr.count) {
        ZCCloudTFCell *tfCell = [collectionView dequeueReusableCellWithReuseIdentifier: NSStringFromClass([ZCCloudTFCell class]) forIndexPath:indexPath];
        return tfCell;
    }
    ZCCloudCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: NSStringFromClass([ZCCloudCell class]) forIndexPath:indexPath];
    ZCCloudTagModel *modle = [self.zcCloudTagArr zcObjectAtIndex:indexPath.row];
    cell.model    = modle;
    cell.cellType = self.zcCellType;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZCCloudTagModel *model = self.zcCloudTagArr[indexPath.row];
    model.isSelected = YES;
    ZCCloudCell *cell = (ZCCloudCell*)[collectionView cellForItemAtIndexPath:indexPath];
    cell.model = model;
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZCCloudTagModel *model = self.zcCloudTagArr[indexPath.row];
    model.isSelected = NO;
    ZCCloudCell *cell = (ZCCloudCell*)[collectionView cellForItemAtIndexPath:indexPath];
    cell.model = model;
}





@end
