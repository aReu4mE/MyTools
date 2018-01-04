//
//  ZCSetting.h
//  aReuTools
//
//  Created by aReu on 2018/1/4.
//  Copyright © 2018年 aReu. All rights reserved.
//

#ifndef ZCSetting_h
#define ZCSetting_h

#define ZCIsIOS4 ([[[UIDevice currentDevice] systemVersion] intValue]==4)
#define ZCIsIOS5 ([[[UIDevice currentDevice] systemVersion] intValue]==5)
#define ZCIsIOS6 ([[[UIDevice currentDevice] systemVersion] intValue]==6)
#define ZCAfterIOS4 ([[[UIDevice currentDevice] systemVersion] intValue] >= 4)
#define ZCAfterIOS5 ([[[UIDevice currentDevice] systemVersion] intValue] >= 5)
#define ZCAfterIOS6 ([[[UIDevice currentDevice] systemVersion] intValue] >= 6)
#define ZCAfterIOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0)
#define ZCAfterIOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)

#define ZCCurrentSystemVersion ([[UIDevice currentDevice] systemVersion])

#define ZCDocumentDirectory\
[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define ZCCachesDirectory\
[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define ZCLibraryDirectory\
[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES) objectAtIndex:0]

#define ZCDocumentSubDirectory(dir)\
[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:dir]

#define ZCLibrarySubDirectory(dir)\
[[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:dir]

#define ZCCacheSubDirectory(dir)\
[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:dir]

#endif /* ZCSetting_h */
