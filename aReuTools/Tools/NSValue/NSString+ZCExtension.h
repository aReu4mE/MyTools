//
//  NSString+ZCExtension.h
//  aReuTools
//
//  Created by aReu on 2018/1/10.
//  Copyright © 2018年 aReu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(ZCExtension)

/**
 NSInteger converted to NSString

 @param value <#value description#>
 @return <#return value description#>
 */
+ (NSString*)zCStringFromValue:(NSInteger)value;

- (NSString *)zCChangetoUTF8;

/**
 Returns the current system time format as follows: "YYYY-MM-dd HH: mm: ss"

 @return <#return value description#>
 */
+ (NSString *)zCGetCurrentTime;

- (BOOL)isNullString;

/**
 Set detection

 @return <#return value description#>
 */
- (BOOL)isMobileNumberClassification;

- (BOOL)isMobileNumber;

- (BOOL)isEmailAddress;

- (BOOL)simpleVerifyIdentityCardNum;

- (BOOL)isCarNumber;

- (BOOL)isValidUrl;

@end



