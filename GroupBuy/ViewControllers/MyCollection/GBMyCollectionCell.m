//
//  GBMyCollectionCell.m
//  GroupBuy
//
//  Created by YANGReal on 14-6-26.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBMyCollectionCell.h"

@interface GBMyCollectionCell ()
@property (weak , nonatomic) IBOutlet UIView *bgView;
@property (weak , nonatomic) IBOutlet UIImageView *mediaView;
@end


@implementation GBMyCollectionCell

- (void)awakeFromNib
{
    // Initialization code
    self.bgView.backgroundColor = WHITE_COLOR;
    self.backgroundColor = CLEAR_COLOR;
    self.mediaView.clipsToBounds = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
