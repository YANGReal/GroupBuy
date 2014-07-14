//
//  GBShareView.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-14.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBShareView.h"

@interface GBShareView ()
- (IBAction)cancel:(id)sender;
- (IBAction)btnClicked:(UIButton *)sender;
@end


@implementation GBShareView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    self.backgroundColor = BG_COLOR;
}

- (void)showInView:(UIView *)view
{
    UIView *baseView = [[UIView alloc] initWithFrame:view.frame];
    baseView.backgroundColor = BLACK_COLOR;
    baseView.alpha = 0.0;
    baseView.tag = -1000;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
    [baseView addGestureRecognizer:tap];
    [view addSubview:baseView];
    self.y = baseView.height;
    [view addSubview:self];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        baseView.alpha = 0.5;
        self.y = baseView.height-self.height;
    }];
    
    
}

- (void)dismiss
{
    UIView *baseView = [self.superview viewWithTag:-1000];
    [UIView animateWithDuration:0.3 animations:^{
        baseView.alpha = 0;
        self.y = baseView.height;
        
    } completion:^(BOOL finished) {
        
        [baseView removeFromSuperview];
        [self removeFromSuperview];
    }];
}

- (IBAction)cancel:(id)sender
{
    [self dismiss];
    
}


- (IBAction)btnClicked:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(shareView:didClickButtonAtIndex:)])
    {
        [self.delegate shareView:self didClickButtonAtIndex:sender.tag];
    }
}


- (void)tapped
{
    [self dismiss];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
