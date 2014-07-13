//
//  GGoodIntroCell.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-13.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GGoodIntroCell.h"

@interface GGoodIntroCell ()
@property (weak , nonatomic) IBOutlet UIView *bgView;
@end

@implementation GGoodIntroCell

- (void)awakeFromNib
{
    // Initialization code
    self.backgroundColor = CLEAR_COLOR;
    self.contentView.backgroundColor = CLEAR_COLOR;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.bgView.backgroundColor = WHITE_COLOR;
    self.bgView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (CGFloat )cellHeight
{
    return 191;
}
@end
