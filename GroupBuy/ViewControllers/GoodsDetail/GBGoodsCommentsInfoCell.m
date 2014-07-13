//
//  GBGoodsCommentsInfoCell.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-13.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBGoodsCommentsInfoCell.h"

@interface GBGoodsCommentsInfoCell ()
@property (weak , nonatomic) IBOutlet UIView *bgView;
@property (weak , nonatomic) IBOutlet RatingView *rationView1,*rationView2,*rationView3;

@end

@implementation GBGoodsCommentsInfoCell

- (void)awakeFromNib
{
    // Initialization code
    self.backgroundColor = CLEAR_COLOR;
    self.contentView.backgroundColor = CLEAR_COLOR;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.bgView.backgroundColor = WHITE_COLOR;
    self.bgView.clipsToBounds = YES;
    
    self.rationView1.itemWidth = 15;
    self.rationView2.itemWidth = 15;
    self.rationView3.itemWidth = 15;
    [self.rationView1 setImagesDeselected:@"star_normal.png" partlySelected:@"" fullSelected:@"star_selected.png" andDelegate:nil space:5];
    [self.rationView1 displayRating:5];
    self.rationView1.backgroundColor = CLEAR_COLOR;
    
    [self.rationView2 setImagesDeselected:@"star_normal.png" partlySelected:@"" fullSelected:@"star_selected.png" andDelegate:nil space:5];
    [self.rationView2 displayRating:4];
    self.rationView2.backgroundColor = CLEAR_COLOR;
    
    [self.rationView3 setImagesDeselected:@"star_normal.png" partlySelected:@"" fullSelected:@"star_selected.png" andDelegate:nil space:5];
    [self.rationView3 displayRating:5];
    self.rationView3.backgroundColor = CLEAR_COLOR;
    
    for (NSInteger i = 100;i<103;i++)
    {
        UIView *line = [self.bgView viewWithTag:i];
        line.backgroundColor = C2;
        line.height = 0.5;
    }
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)cellHeight
{
    return 191;
}

@end
