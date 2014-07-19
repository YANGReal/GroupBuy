//
//  GBAddGoodCell.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-19.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBAddGoodCell.h"

@interface GBAddGoodCell ()
@property (weak , nonatomic) IBOutlet UIView *bgView;

@property (weak , nonatomic) IBOutlet UIImageView *arrow;
@end

@implementation GBAddGoodCell

- (void)awakeFromNib
{
    // Initialization code
  
    self.backgroundColor = CLEAR_COLOR;
    self.bgView.backgroundColor = WHITE_COLOR;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textField.placeholder = _title;
    if ([self.title isEqualToString:@"商品类别"])
    {
        self.textField.text = _title;
        self.arrow.hidden = NO;
        self.textField.userInteractionEnabled = NO;
       
    }
    else
    {
        self.arrow.hidden = YES;
    
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
