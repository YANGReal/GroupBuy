//
//  UIView+Flip.m
//  FlipDemo
//
//  Created by YANGRui on 14-3-19.
//  Copyright (c) 2014年 YANGRui. All rights reserved.
//

#import "UIView+Flip.h"
#import <QuartzCore/QuartzCore.h>
@implementation UIView (Flip)


- (void)startFlip
{
    CATransform3D leftRotate = CATransform3DMakeRotation(M_PI/6, 0, 1, 0);
    
    self.layer.transform = [self CATransform3DPerspect:leftRotate center:CGPointMake(0, 0) Disz:100];//
    
    [UIView animateWithDuration:1.0 animations:^{
        
        CATransform3D leftRotate = CATransform3DMakeRotation(M_PI/6, 0, -0, 0);
        self.layer.transform = [self CATransform3DPerspect:leftRotate center:CGPointMake(0, 0) Disz:100];//
    }];

}




- (CATransform3D)CATransform3DMakePerspectives:(CGPoint)center DisZ:(float) disZ
{
    CATransform3D transToCenter = CATransform3DMakeTranslation(-center.x, -center.y, 0);
    CATransform3D transBack = CATransform3DMakeTranslation(center.x, center.y, 0);
    CATransform3D scale = CATransform3DIdentity;
    scale.m34 = -1.0f/disZ;
    return CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);
}

- (CATransform3D)CATransform3DPerspect:(CATransform3D)t center:(CGPoint) center Disz:(float)disZ
{
    CATransform3D catransform3D = [self CATransform3DMakePerspectives:center DisZ:disZ];
    
    return CATransform3DConcat(t,catransform3D);
}



@end
