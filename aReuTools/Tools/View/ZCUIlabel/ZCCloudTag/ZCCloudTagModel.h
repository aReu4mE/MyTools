//
//  ZCCloudTagModel.h
//  aReuTools
//
//  Created by aReu on 2018/1/26.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCCloudTagModel : NSObject<NSCopying>

///cloudTag text
@property (copy, nonatomic) NSString *cloudText;
///current Tag is selected
@property (assign,nonatomic) BOOL isSelected;

@end
