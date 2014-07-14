//
//  YRZoomingVIew.m
//  iCanvas
//
//  Created by 杨锐 on 13-8-17.
//  Copyright (c) 2013年 yangrui. All rights reserved.
//

#import "YRZoomingView.h"

@implementation YRZoomingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.imgView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imgView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.imgView];
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.backgroundColor = [UIColor clearColor];
        self.minimumZoomScale = 1;
        self.maximumZoomScale = 3;
        self.delegate = self;
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapped:)];
        doubleTap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubleTap];
    }
    return self;
}

- (void)doubleTapped:(UITapGestureRecognizer *)sender
{
    if (self.zoomScale > 1.0)
    {
        [self setZoomScale:1.0 animated:YES];
    }
    else
    {
        CGPoint point = [sender locationInView:self];
        [self zoomToRect:CGRectMake(point.x-50, point.y-50, 100, 100) animated:YES];
    }
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imgView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
  //  self.imgView.frame = self.bounds;
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
