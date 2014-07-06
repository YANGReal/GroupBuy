//
//  GBCollectionAuctionCell.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-6.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBCollectionAuctionCell.h"

@interface GBCollectionAuctionCell ()

@property (weak , nonatomic) IBOutlet UIImageView *mediaView;
@property (weak , nonatomic) IBOutlet UIView *bgView;
@property (weak , nonatomic) IBOutlet UIView *line;
@end


@implementation GBCollectionAuctionCell

- (void)awakeFromNib
{
    // Initialization code
    self.bgView.backgroundColor = WHITE_COLOR;
    self.backgroundColor = CLEAR_COLOR;
    self.mediaView.clipsToBounds = YES;
    self.line.backgroundColor = C2;
    self.line.height = 0.5;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
