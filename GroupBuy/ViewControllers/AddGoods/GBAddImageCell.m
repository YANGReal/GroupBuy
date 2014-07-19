//
//  GBAddImageCell.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-19.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBAddImageCell.h"

@interface GBAddImageCell ()

@property (weak , nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation GBAddImageCell

- (void)awakeFromNib
{
    // Initialization code
    self.imgView.clipsToBounds = YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imgView.image = _image;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
