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
const CGFloat itemHeight  = 25.0f;
const CGFloat lineSpacing = 12.0f;

@interface ZCCloudTagView ()<UICollectionViewDataSource,UIScrollViewDelegate,UICollectionViewDelegateLeftAlignedLayout>
{
    NSMutableArray *_zcMutCloudTagArr;
    NSIndexPath    *_selectIndexPath;
}
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

- (void)setZcCloudTagArr:(NSArray<ZCCloudTagModel *> *)zcCloudTagArr
{
    _zcCloudTagArr = [zcCloudTagArr copy];
    [_zcMutCloudTagArr removeAllObjects];
    [_zcMutCloudTagArr addObjectsFromArray:_zcCloudTagArr];
}

#pragma mark - initSetting
- (void)inittSetting
{
    _zcMutCloudTagArr  = @[].mutableCopy;
    self.zcCloudTagArr = @[];
    self.dataSource    = self;
    self.delegate      = self;
    self.backgroundColor = [UIColor clearColor];
    [self registerClass:[ZCCloudTFCell class] forCellWithReuseIdentifier:NSStringFromClass([ZCCloudTFCell class])];
    [self registerClass:[ZCCloudCell class] forCellWithReuseIdentifier:NSStringFromClass([ZCCloudCell class])];
    //default is NO
    self.allowsMultipleSelection = YES;
    
    UILongPressGestureRecognizer *lGr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(couldCellLongPressAction:)];
    [self addGestureRecognizer:lGr];
}

#pragma mark - UICollectionViewDelegateLeftAlignedLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _zcMutCloudTagArr.count) {
        CGSize tfSize = [CloudPlaceholder sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]}];
        return CGSizeMake((tfSize.width + itemIterval), itemHeight);
    }
    ZCCloudTagModel *model = (ZCCloudTagModel*)[_zcMutCloudTagArr zcObjectAtIndex:indexPath.row];
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
    return _zcMutCloudTagArr.count + 1;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    __weak typeof(self) weakSelf = self;
    if (indexPath.row == _zcMutCloudTagArr.count) {
        ZCCloudTFCell *tfCell = [collectionView dequeueReusableCellWithReuseIdentifier: NSStringFromClass([ZCCloudTFCell class]) forIndexPath:indexPath];
        [tfCell setAddCellHandler:^(ZCCloudTagModel *model) {
            __strong typeof(self) strongSelf = weakSelf;
            [strongSelf addCellWithModel:model];
        }];
        return tfCell;
    }
    
    ZCCloudCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: NSStringFromClass([ZCCloudCell class]) forIndexPath:indexPath];
    ZCCloudTagModel *model = [_zcMutCloudTagArr zcObjectAtIndex:indexPath.row];
    cell.model    = model;
    cell.cellType = self.zcCellType;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZCCloudTagModel *model = _zcMutCloudTagArr[indexPath.row];
    model.isSelected  = YES;
    ZCCloudCell *cell = (ZCCloudCell*)[collectionView cellForItemAtIndexPath:indexPath];
    cell.model = model;
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //update SelectState
    ZCCloudTagModel *model = _zcMutCloudTagArr[indexPath.row];
    model.isSelected  = NO;
    ZCCloudCell *cell = (ZCCloudCell*)[collectionView cellForItemAtIndexPath:indexPath];
    cell.model = model;
}

#pragma mark - CustomMethod

#pragma mark - AddCell
- (void)addCellWithModel:(ZCCloudTagModel*)model
{
    [_zcMutCloudTagArr addObject:model];
    
    [self performBatchUpdates:^{
        NSIndexPath *newTFIndexPath = [NSIndexPath indexPathForItem: _zcMutCloudTagArr.count inSection:0];
        NSIndexPath *newIndexPath   = [NSIndexPath indexPathForItem: _zcMutCloudTagArr.count-1 inSection:0];
        [self moveItemAtIndexPath:newIndexPath toIndexPath:newTFIndexPath];
        [self insertItemsAtIndexPaths:@[newIndexPath]];
    } completion:^(BOOL finished) {
        //TODO
    }];
}

#pragma mark - DeleCell
- (void)deleCellAtIndexpath
{
    [_zcMutCloudTagArr removeObjectAtIndex:_selectIndexPath.row];
    [self performBatchUpdates:^{
//        [self moveItemAtIndexPath:newIndexPath toIndexPath:newTFIndexPath];
        [self deleteItemsAtIndexPaths:@[_selectIndexPath]];
    } completion:^(BOOL finished) {
        //TODO
    }];
}

#pragma mark - Action
- (void)couldCellLongPressAction:(UILongPressGestureRecognizer *)gr
{
    if (gr.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        UIMenuItem *deleteItem = [[UIMenuItem alloc] initWithTitle:@"删除" action:@selector(deleteMenuAction:)];
        [menuController setMenuItems:@[deleteItem]];
        
        CGPoint selPoint = [gr locationInView:self];
        _selectIndexPath =  [self indexPathForItemAtPoint:selPoint];
        ZCCloudCell *cell = (ZCCloudCell *)[self cellForItemAtIndexPath:_selectIndexPath];
        [menuController setTargetRect:cell.frame inView:self];
        [menuController setMenuVisible:YES animated:YES];
    }
}

- (void)deleteMenuAction:(UIMenuItem*)item
{
    [self deleCellAtIndexpath];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

@end
