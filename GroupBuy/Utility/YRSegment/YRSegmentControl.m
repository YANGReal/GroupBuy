//
//  YRSegmentControl.m
//  GroupBuy
//
//  Created by YANGReal on 14-6-26.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "YRSegmentControl.h"

@interface YRSegmentControl ()

@property (strong, nonatomic) NSMutableArray *btnArray;
@property (strong , nonatomic) NSMutableArray *lineArray;
@property (strong , nonatomic) NSArray *items;
@property (strong , nonatomic) UIView *slider;
@end

@implementation YRSegmentControl

- (id)initWithFrame:(CGRect)frame items:(NSArray *)items
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.btnArray = [NSMutableArray array];
        self.lineArray = [NSMutableArray array];
        CGFloat btnWidth = frame.size.width/items.count;
        CGFloat btnHeight = frame.size.height;
        self.slider = [[UIView alloc] initWithFrame:RECT(0, 0, btnWidth, btnHeight)];
        [self addSubview:self.slider];
        for (NSInteger i = 0;i<items.count;i++)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(i*btnWidth, 0, btnWidth,btnHeight);
            btn.tag = i;
            [btn setTitle:items[i] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            if (i == 0)
            {
                btn.selected = YES;
            }
            [self addSubview:btn];
            [self.btnArray addObject:btn];
        }
        
        for (NSInteger i = 0;i<items.count-1;i++)
        {
            UIView *line = [[UIView alloc] initWithFrame:RECT((i+1)*btnWidth, 0, 0.5, btnHeight)];
            [self addSubview:line];
            [self.lineArray addObject:line];
            
        }
    }
    return self;
}




- (void)btnClicked:(UIButton *)sender
{
    for (UIButton *btn in _btnArray)
    {
        if (btn == sender)
        {
            btn.selected = YES;
        }
        else
        {
            btn.selected = NO;
        }
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.slider.x = sender.x;
    }];
    
    if ([self.delegate respondsToSelector:@selector(segmentControl:didSelectIndex:)])
    {
        [self.delegate segmentControl:self didSelectIndex:sender.tag];
    }
}

- (void)setTitleColor:(UIColor *)titleColor forState:(UIControlState)state
{
    for (UIButton *btn in _btnArray)
    {
        [btn setTitleColor:titleColor forState:state];
    }
}



- (void)setItemColor:(UIColor *)color forState:(UIControlState)state
{
    if (state == UIControlStateNormal)
    {
        self.backgroundColor = color;
    }
    else
    {
        self.slider.backgroundColor = color;
    }
    return;
    for (UIButton *btn in _btnArray)
    {
        [btn setBackgroundImage:[UIImage imageWithColor:color] forState:state];
    }
}

- (void)setFont:(UIFont *)font
{
    for (UIButton *btn in _btnArray)
    {
        btn.titleLabel.font = font;
    }
}

- (void)setBorderColor:(UIColor *)borderColor
{
    [self setupBorder:borderColor cornerRadius:_borderCorner];
    
    for (UIView *line in _lineArray)
    {
        line.backgroundColor = borderColor;
    }
}


//@property (strong , nonatomic) UIColor *borderColor;
//@property (assign , nonatomic) CGFloat borderCorner;
//@property (weak , nonatomic) UIFont *font;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
