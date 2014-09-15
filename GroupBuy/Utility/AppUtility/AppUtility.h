//
//  AppUtility.h
//  iCareer
//
//  Created by YANGRui on 14-3-6.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NZAlertView.h"

@interface AppUtility : NSObject

/*根据ViewController获得对应xib的文件名*/
+ (NSString *)getNibNameFromViewController:(NSString *)vc;

/*验证邮箱*/
+ (BOOL)isValidateEmail:(NSString *)email;

/*验证手机号*/
+ (BOOL)isValidateMobile:(NSString *)mobile;

/*计算但当前时间加上多少天后的时间*/
+ (NSDate *)dateAfterDay:(int)day;

/*计算当前时间*/
+ (NSString *)curentDate;

/*从UserDefault获取数据*/
+ (id)getObjectForKey:(NSString *)key;

/*向UserDefault写入数据*/
+ (void)storeObject:(id)obj forKey:(NSString *)key;

/*从UserDefault删除数据*/
+ (void)removeObjectForkey:(NSString *)key;

+ (void)setBool:(BOOL) value forkey:(NSString *)key;

+ (BOOL)getBoolForkey:(NSString *)key;

/*计算给定字符串的高度*/
+ (CGSize)getLabelSizeWithText:(NSString *)text font:(int)fontSize width:(float)width;

/*验证纯数字*/
+ (BOOL)isDightWithText:(NSString *)text;

/*获取字符串的MD5值*/
+ (NSString *)md5String:(NSString *)str;

/*判断网络是否可用*/
+ (BOOL)isNetworkAvaliable;


+ (void)showAlertWithMessage:(NSString *)message;

+ (void)showNZAlertWithMessage:(NSString *)message andStyle:(NZAlertStyle) style;

+ (NSInteger)numberNotInArray:(NSArray *)array;

@end
