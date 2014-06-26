//
//  YRSegmentControl.h
//  GroupBuy
//
//  Created by YANGReal on 14-6-26.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import <UIKit/UIKit.h>



@class YRSegmentControl;

@protocol YRSegmentControlDelegate <NSObject>

@optional

- (void)segmentControl:(YRSegmentControl *)segment didSelectIndex:(NSInteger)index;

@end

@interface YRSegmentControl : UIView

@property (assign , nonatomic) id<YRSegmentControlDelegate>delegate;
@property (strong , nonatomic) UIColor *borderColor;
@property (assign , nonatomic) CGFloat borderCorner;
@property (weak , nonatomic) UIFont *font;
- (id)initWithFrame:(CGRect)frame items:(NSArray *)items;

- (void)setTitleColor:(UIColor *)titleColor forState:(UIControlState)state;
- (void)setItemColor:(UIColor *)color forState:(UIControlState)state;

@end
