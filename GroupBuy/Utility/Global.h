//
//  Global.h
//  iCareer
//
//  Created by YANGRui on 14-2-27.
//  Copyright (c) 2014年 LJ. All rights reserved.
//

#ifndef iCareer_Global_h
#define iCareer_Global_h

#pragma mark --导入头文件
#import "AppUtility.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "NSDictionary+JSON.h"
#import "UIColor+HexString.h"
#import "RegexKitLite.h"
#import "UIImage+Loader.h"
#import "UIView+Border.h"
#import "UIView+Joggle.h"
#import "UIView+ModifyFrame.h"
#import "NBNetworkEngine.h"
#import "NZAlertView.h"
#import "NBNavigationController.h"
#import "MMLocationManager.h"
#import "DXAlertView.h"
#import "ETActivityIndicatorView.h"
#import "UIView+Flip.h"
#import "NBBaseViewController.h"
#pragma mark --定义常用宏

#define IS_FIRST_USE @"is_first_use"
#define REMEMBER_PASS_WORD @"remember_password"
#define USER_NAME @"username"
#define PASS_WORD @"password"
#define UID @"uid"
/*********************
 几何尺寸
 *********************/
#define ISIP5 ([UIScreen mainScreen].bounds.size.height == 568 ? YES : NO)
#define IP5ORIP4FRAME [UIScreen mainScreen].bounds.size.height == 568 ? CGRectMake(0.0, 0.0, 320.0, 568.0) : CGRectMake(0.0, 0.0, 320.0, 480.0)
#define RECT(x,y,w,h) CGRectMake(x,y,w,h)
#define POINT(x,y) CGPointMake(x,y)

#define DEVICE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define DEVICE_WIDTH [UIScreen mainScreen].bounds.size.width

#define NAV_HEIGHT 64


/*********************
 常用颜色
 *********************/
#define WHITE_COLOR   [UIColor whiteColor]                    //白色
#define BLACK_COLOR   [UIColor blackColor]                    //黑色
#define CLEAR_COLOR   [UIColor clearColor]                    //透明色
#define DEEP_BLUE     [UIColor colorWithHexString:@"#2c4484"] //深蓝色
#define LIGHT_BLUE    [UIColor colorWithHexString:@"#26ace5"] //浅蓝色
#define DEEP_PURPLE   [UIColor colorWithHexString:@"#702d88"] //深紫色
#define LIGHT_PURPLE  [UIColor colorWithHexString:@"#c46096"] //浅紫色
#define YELLOW_COLOR  [UIColor colorWithHexString:@"#feaa24"] //明黄色
#define RED_COLOR     [UIColor colorWithHexString:@"#ff5a54"] //粉红色


#pragma mark -- 定义APP沙盒路径
/******************************
 定义APP沙盒路径
 ******************************/
#define DOCUMENTPATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define TMPPATH NSTemporaryDirectory()
#define CACHPATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define CACH_DOCUMENTS_PATH(fileName) [CACHPATH stringByAppendingPathComponent:fileName]//缓存文件路径
#define DOCUMENTS_PATH(fileName) [DOCUMENTPATH stringByAppendingPathComponent:fileName]//Documents文件夹路径

#pragma mark --定义颜色
/******************************
 定义RGB颜色
 ******************************/
#define RGBColor(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a*1.0]


#pragma mark --定义日志输出
/******************************
 定义日志输出模式
 DLog is almost a drop-in replacement for NSLog
 DLog();
 DLog(@"here");
 DLog(@"value: %d", x);
 Unfortunately this doesn't work DLog(aStringVariable); you have to do this instead DLog(@"%@", aStringVariable);
 ******************************/
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#endif

// ALog always displays output regardless of the DEBUG setting
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);


#endif
