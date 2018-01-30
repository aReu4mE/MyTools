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

//Limit the length of the text displayed in the edit text
const NSInteger textMaxLength = 14;
//Long press to eject the desired time for deletion
const CGFloat pressDuration = 1.5f;
//ZCCloudTFCell placeHolder
NSString * const CloudPlaceholder = @" 请输入标签.";

@interface ZCCloudCell ()
{
    UIMenuController *menuController;
}
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
    self.textLabel       = [[UILabel alloc] initWithFrame:self.bounds];
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.font  = [UIFont systemFontOfSize:14.0f];
    self.borderColor     = [UIColor redColor];
    [self addSubview:self.textLabel];
}

- (void)layoutSubviews
{
    self.textLabel.zc_width = self.zc_width;
}

- (void)setModel:(ZCCloudTagModel *)model
{
    if (!model) return;
    _model = model;
    self.textLabel.text = model.cloudText;
    
    if (model.isSelected) {
        self.backgroundColor     = self.borderColor;
        self.textLabel.textColor = [UIColor whiteColor];
    }else{
        self.backgroundColor     = [UIColor whiteColor];
        self.textLabel.textColor = self.borderColor;
    }
}

- (void)setCellType:(CloudCellType)cellType
{
    _cellType = cellType;
    switch (cellType) {
        case CloudCellTypeRound:
            [self.textLabel setCorner:self.zc_height/2.0
                borderWidth:1.0
                borderColor:self.borderColor];
            break;
            
        case CloudCellTypeRectangle:
            self.textLabel.layer.borderWidth = 1.0f;
            self.textLabel.layer.borderColor = self.borderColor.CGColor;
            break;
            
        case CloudCellTypeOnlyTitle:
            break;
            //TODO
        default:
            break;
    }
}

@end


@interface ZCCloudTFCell ()<UITextFieldDelegate>

@property (strong, nonatomic) UITextField  *cloudTagTextfield;

@property (copy, nonatomic) NSString *subCutText;

@end

@implementation ZCCloudTFCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        [self initTFSetting];
    }
    return self;
}

- (void)initTFSetting
{
    self.cloudTagTextfield = [[UITextField alloc] initWithFrame:self.bounds];
    self.cloudTagTextfield.placeholder = CloudPlaceholder;
    self.cloudTagTextfield.delegate    = self;
    self.cloudTagTextfield.font        = [UIFont systemFontOfSize:14.0f];
    [self.cloudTagTextfield addTarget:self action:@selector(cloudTagTextfieldChanged:) forControlEvents:UIControlEventAllEditingEvents];
    [self addSubview:self.cloudTagTextfield];
}

- (void)refreshTFState
{
    [self.cloudTagTextfield resignFirstResponder];
    self.cloudTagTextfield.text = @"";
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (_addCellHandler && self.subCutText.length > 0) {
        ZCCloudTagModel *model = [ZCCloudTagModel new];
        model.cloudText  = self.subCutText;
        model.isSelected = NO;
        self.addCellHandler(model);
        [self refreshTFState];
    }
    return YES;
}

- (void)cloudTagTextfieldChanged:(UITextField *)tf
{
    if(!(tf.text.length > 0)) return;
    self.subCutText = tf.text;
    if(tf.text.length > textMaxLength){
        self.subCutText = [tf.text substringToIndex:textMaxLength];
    }
}

@end
