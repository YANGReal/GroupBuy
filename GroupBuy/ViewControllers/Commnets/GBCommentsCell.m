//
//  GBCommentsCell.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-14.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBCommentsCell.h"


@interface GBCommentsCell ()
@property (weak , nonatomic) IBOutlet UIView *line;
@end

@implementation GBCommentsCell

- (void)awakeFromNib
{
    // Initialization code
    self.backgroundColor = CLEAR_COLOR;
    self.line.height = 0.5;
    self.line.backgroundColor = C2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
