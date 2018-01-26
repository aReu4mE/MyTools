//
//  ZCCloudCell.m
//  aReuTools
//
//  Created by aReu on 2018/1/26.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import "ZCCloudCell.h"
#import "UIView+ZCExtension.h"
#import "ZCCloudTagModel.h"

@interface ZCCloudCell ()

@property (strong, nonatomic) UILabel *textLabel;

@end

@implementation ZCCloudCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        [self initSetting];
    }
    return self;
}


- (void)initSetting
{
    self.backgroundColor = [UIColor clearColor];
    self.textLabel = [[UILabel alloc] initWithFrame:self.bounds];
    [self addSubview:self.textLabel];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.font = [UIFont systemFontOfSize:14.0f];
    self.borderColor = [UIColor greenColor];
    
}

- (void)setModel:(ZCCloudTagModel *)model
{
    if (!model) return;
    _model = model;
    self.textLabel.text = _model.cloudText;
}

- (void)setCellType:(CloudCellType)cellType
{
    _cellType = cellType;
    switch (cellType) {
            
        case CloudCellTypeRound:
            [self setCorner:self.zc_height/2.0
                borderWidth:1.0
                borderColor:self.borderColor];
            break;
            
        case CloudCellTypeRectangle:
            [self setCorner:1.0
                borderWidth:1.0
                borderColor:self.borderColor];
//            self.layer.borderColor = [UIColor redColor].CGColor;
//            self.layer.borderWidth = 2.0;
            break;
            
        case CloudCellTypeOnlyTitle:
            break;
            
        default:
            break;
    }
}

@end


@implementation ZCCloudTFCell

@end
