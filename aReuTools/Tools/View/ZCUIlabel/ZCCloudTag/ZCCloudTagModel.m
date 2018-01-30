//
//  ZCCloudTagModel.m
//  aReuTools
//
//  Created by aReu on 2018/1/26.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import "ZCCloudTagModel.h"

@implementation ZCCloudTagModel

- (id)copyWithZone:(nullable NSZone *)zone
{
    ZCCloudTagModel *model = [[ZCCloudTagModel allocWithZone:zone] init];
    model.cloudText = [self.cloudText copy];
    model.isSelected = self.isSelected;
    return model;
}

@end
