//
//  UIVew+Border.m
//  sayburg
//
//  Created by YANGReal on 13-9-21.
//  Copyright (c) 2013年 somilk. All rights reserved.
//

#import "UIView+Border.h"

@implementation UIView (Border)
- (void)setupBorder:(UIColor *)borderColor cornerRadius:(CGFloat)radius;
{
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.masksToBounds = YES;
    
}

const CGFloat kReflectPercent = -0.25f;
const CGFloat kReflectOpacity = 0.5f;
const CGFloat kReflectDistance = 150.0f;

-(void)addSimpleReflection
{
    CALayer *reflectionLayer = [CALayer layer];
    reflectionLayer.contents = [self layer].contents;
    reflectionLayer.opacity = kReflectOpacity;
    reflectionLayer.frame = CGRectMake(0.0f,0.0f,self.frame.size.width,self.frame.size.height*kReflectPercent);  //倒影层框架设置，其中高度是原视图的百分比
    CATransform3D stransform = CATransform3DMakeScale(1.0f,-1.0f,1.0f);
    CATransform3D transform = CATransform3DTranslate(stransform,0.0f,-(kReflectDistance + self.frame.size.height),0.0f);
    reflectionLayer.transform = transform;
    reflectionLayer.sublayerTransform = reflectionLayer.transform;
    [[self layer] addSublayer:reflectionLayer];
}

@end
