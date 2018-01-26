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

@interface ZCCloudTagView ()<UICollectionViewDataSource,UIScrollViewDelegate,UICollectionViewDelegateLeftAlignedLayout>


//1.实现数据展示，label宽度随文件的长度而变化，
//2.实现最后一位置为文本输入可编辑cell
//3.长按删除标签
//4.建立数据模型，保存每一个标签值（可扩展数据）
//5.低耦合，避免嵌入麻烦   文件尽量限制在3个之内
@end

@implementation ZCCloudTagView


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    UICollectionViewLeftAlignedLayout *leftLayout = [[UICollectionViewLeftAlignedLayout alloc] init];
    if (self = [super initWithFrame:frame collectionViewLayout:leftLayout]) {
        [self inittSetting];
    }
    return self;
}

#pragma mark - initSetting
- (void)inittSetting
{
    self.zcCloudTagArr = @[];
    self.dataSource = self;
    self.delegate = self;
    [self registerClass:[ZCCloudTFCell class] forCellWithReuseIdentifier:NSStringFromClass([ZCCloudTFCell class])];
    [self registerClass:[ZCCloudCell class] forCellWithReuseIdentifier:NSStringFromClass([ZCCloudCell class])];
}

#pragma mark - UICollectionViewDelegateLeftAlignedLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = [self.zcCloudTagArr ]
//    return CGSizeMake(pixel(size.width + 16), 30);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 12;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 12;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(12, 12, 12, 12);
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.zcCloudTagArr.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZCCloudCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: NSStringFromClass([ZCCloudCell class]) forIndexPath:indexPath];
    cell.cellType = self.zcCellType;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZCCloudCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}









@end
