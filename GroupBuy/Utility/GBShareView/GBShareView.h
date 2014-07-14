//
//  GBShareView.h
//  GroupBuy
//
//  Created by YANGReal on 14-7-14.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GBShareView;

@protocol GBShareViewDelegate <NSObject>

@optional

- (void)shareView:(GBShareView *)view didClickButtonAtIndex:(NSInteger)index;

@end


@interface GBShareView : UIView
@property (assign , nonatomic) id<GBShareViewDelegate>delegate;

- (void)showInView:(UIView *)view;

@end
