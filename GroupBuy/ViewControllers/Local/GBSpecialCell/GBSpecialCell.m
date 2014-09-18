//
//  GBSpecialCell.m
//  GroupBuy
//
//  Created by YANGReal on 14-9-18.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBSpecialCell.h"

@interface GBSpecialCell ()
@property (weak , nonatomic) IBOutlet UIImageView *coverView;
@end

@implementation GBSpecialCell

- (void)awakeFromNib
{
    // Initialization code
    self.coverView.clipsToBounds = YES;
    self.backgroundColor = CLEAR_COLOR;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
