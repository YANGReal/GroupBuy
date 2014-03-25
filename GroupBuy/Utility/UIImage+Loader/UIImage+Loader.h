//
//  UIImage+Loader.h
//  ToolFramework
//
//  Created by  YANGReal on 13-1-29.
//  Copyright (c) 2013年 YANGReal. All rights reserved.
//
// UIImage扩展类

#import <UIKit/UIKit.h>

@interface UIImage (Loader)

/*
 程序内读取文件
 */

+ (UIImage *)imageFromMainBundleFile:(NSString*)aFileName;

/*
 应用程序沙盒内读取文件
 */

+ (UIImage *)imageFromDocumentsFileName:(NSString *)aFileName filePath:(NSString *)path;

/*
 创建纯色UIImage
 */

+ (UIImage *)createImageWithColor:(UIColor *)color andImageHeight:(CGFloat) height;


/*
 从URL获取图片
 */

+ (UIImage *)imageFromURL:(NSString *)url;


/*
 等比缩放
 */

- (UIImage*)scaleToSize:(CGSize)size;
/*
 裁剪图片
 */
- (UIImage*)getSubImage:(CGRect)rect;

/*
 裁剪方形图片
 */
+ (UIImage *)cutImage:(UIImage *)image;

/*
 裁剪圆形图片
 */
+(UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset;

- (UIImage *)resizeImageToSize:(CGSize)size;

//+ (UIImage *)getImage:(NSURL *)videoURL;

#pragma mark - 把图片分割成两半
+ (NSArray *)splitImageIntoTwoParts:(UIImage *)image;

#pragma mark -模糊化图片 
//0.0-1.0
- (UIImage *)blurredImage:(CGFloat)blurAmount;

#pragma mark - 截屏
+ (UIImage *)screenshot;






@end
