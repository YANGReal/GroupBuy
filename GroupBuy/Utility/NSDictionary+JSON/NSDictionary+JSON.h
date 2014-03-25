//
//  NSDictionary+JSON.h
//  ToolFramework
//
//  Created by  Jason on 13-1-28.
//  Copyright (c) 2013年 BlueBox. All rights reserved.
//
// NSDictionary扩展类 同时适用于NSMutableDictionary

#import <Foundation/Foundation.h>

@interface NSDictionary (JSON)

/*
 获取int类型的数据
 */

- (int)intAttribute:(NSString *)attribute defaultValue:(int)defaultValue;

/*
 获取NSInteger类型的数据
 */

- (NSInteger)integerAttribute:(NSString *)attribute defaultValue:(NSInteger)defaultValue;

/*
 获取float类型的数据
 */

- (float)floatAttribute:(NSString *)attribute defaultValue:(float)defaultValue;

/*
 获取bool类型的数据
 */
- (BOOL)boolAttribute:(NSString *)attribute defaultValue:(BOOL)defalutValue;

/*
 获取NSString类型的数据
 */

- (NSString *)stringAttribute:(NSString *)attribute;


- (id)getAttribute:(NSString *)attribute;
@end
