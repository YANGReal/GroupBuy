//
//  GBGoodsRulesCell.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-13.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBGoodsRulesCell.h"

@interface GBGoodsRulesCell ()

@property (weak , nonatomic) IBOutlet UIView *bgView;
@property (weak , nonatomic) IBOutlet UIView *line1;
@end

@implementation GBGoodsRulesCell

- (void)awakeFromNib
{
    // Initialization code
    self.backgroundColor = CLEAR_COLOR;
    self.contentView.backgroundColor = CLEAR_COLOR;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.bgView.backgroundColor = WHITE_COLOR;
    self.bgView.clipsToBounds = YES;
    
    self.line1.backgroundColor =  C2;
    self.line1.height =  0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (CGFloat)cellHeightWithData:(NSDictionary *)data
{
    return 191;
}
@end
