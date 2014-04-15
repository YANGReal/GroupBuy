//
//  GBOrderCell.m
//  GroupBuy
//
//  Created by YANGReal on 14-3-25.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBOrderCell.h"

@interface GBOrderCell ()
{
   
    IBOutlet UIImageView *imgView;
    IBOutlet UILabel *priceLabel;
    IBOutlet UILabel *countLabel;
    IBOutlet UIButton *commentButton;
    IBOutlet UILabel *titleLabel;
    
}



@end

@implementation GBOrderCell





- (void)awakeFromNib
{
    // Initialization code
    titleLabel.text = @"多伦多午夜KTV";
    countLabel.text = @"111";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
