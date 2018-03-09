//
//  GodObj.h
//  aReuTools
//
//  Created by aReu on 2018/1/18.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GodObj : NSObject<NSCopying,NSMutableCopying,NSCoding>

///<#name#>
@property (strong, nonatomic) NSString *str1;
///<#name#>
@property (assign, nonatomic) BOOL isEat;

@property (copy, nonatomic) void(^messageBlock)(void);


@property (nonatomic, strong) dispatch_block_t block;
@property (nonatomic, assign) NSInteger tem;


//- (void)test;
@end
