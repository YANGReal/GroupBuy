//
//  UIColor+HexString.h
//  ToolFramework
//
//  Created by  Jason on 13-1-28.
//  Copyright (c) 2013年 BlueBox. All rights reserved.
//
// UIColor扩展类，使用16进制进行颜色的赋值

#import <UIKit/UIKit.h>

@interface UIColor (HexString)

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha;

@end
