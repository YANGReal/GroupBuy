//
//  UIVew+Joggle.m
//  sayburg
//
//  Created by YANGReal on 13-9-22.
//  Copyright (c) 2013年 YANGReal. All rights reserved.
//

#import "UIView+Joggle.h"
#define COUNT 2000
@implementation UIView (Joggle)


- (void)startAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.1;
    animation.repeatCount = COUNT;
    animation.autoreverses = YES;
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform, -0.01, 0.0, 0.0, 0.01)];
    animation.toValue=[NSValue valueWithCATransform3D:CATransform3DRotate (self.layer.transform, 0.01, 0.0, 0.0, 0.01)];
    [self.layer addAnimation:animation forKey:@"joggle"];
}

- (void)stopAnimation
{
    [self.layer removeAllAnimations];
}


@end
