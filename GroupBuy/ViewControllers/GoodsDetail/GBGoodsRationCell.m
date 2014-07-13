//
//  GBGoodsRationCell.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-13.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBGoodsRationCell.h"

@interface GBGoodsRationCell ()
@property (weak , nonatomic) IBOutlet UIView *bgView;
@property (weak , nonatomic) IBOutlet RatingView *rationView;
@property (weak , nonatomic) IBOutlet UIView *line;
@end


@implementation GBGoodsRationCell

- (void)awakeFromNib
{
    // Initialization code
    self.backgroundColor = CLEAR_COLOR;
    self.contentView.backgroundColor = CLEAR_COLOR;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.bgView.backgroundColor = WHITE_COLOR;
    self.bgView.clipsToBounds = YES;
    self.line.backgroundColor = C2;
    self.line.height = 0.5;
    self.rationView.itemWidth =  15;
    [self.rationView setImagesDeselected:@"star_normal.png" partlySelected:@"" fullSelected:@"star_selected.png" andDelegate:nil space:5];
    [self.rationView displayRating:5];
    self.rationView.backgroundColor = CLEAR_COLOR;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (CGFloat)cellHeight
{
    return 76;
}
@end
