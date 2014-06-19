//
//  GBMessageCell.m
//  GroupBuy
//
//  Created by YANGReal on 14-6-19.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBMessageCell.h"

@interface GBMessageCell ()
@property (weak , nonatomic) IBOutlet UILabel *titleLabel;
@property (weak , nonatomic) IBOutlet UILabel *contentLabel;
@property (weak , nonatomic) IBOutlet UILabel *dateLabel;
@property (weak , nonatomic) IBOutlet UIView *bgView;
@end

@implementation GBMessageCell

- (void)awakeFromNib
{
    // Initialization code
    self.backgroundColor = CLEAR_COLOR;
    self.bgView.backgroundColor = WHITE_COLOR;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
