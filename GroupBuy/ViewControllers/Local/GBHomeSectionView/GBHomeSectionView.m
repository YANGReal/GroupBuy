//
//  GBHomeSectionView.m
//  GroupBuy
//
//  Created by YANGReal on 14-9-18.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBHomeSectionView.h"

@interface GBHomeSectionView ()
@property (weak , nonatomic) IBOutlet UILabel *titleLabel;
@property (weak , nonatomic) IBOutlet UIView *bgView;
@end

@implementation GBHomeSectionView

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
    self.bgView.backgroundColor = WHITE_COLOR;
    
}

- (void)layoutSubviews
{
    self.titleLabel.text = _title;
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
