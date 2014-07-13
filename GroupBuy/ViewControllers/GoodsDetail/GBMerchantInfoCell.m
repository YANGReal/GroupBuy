//
//  GBMerchantInfoCell.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-13.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBMerchantInfoCell.h"

@interface GBMerchantInfoCell ()
@property (weak , nonatomic) IBOutlet UIView *bgView;
@property (weak , nonatomic) IBOutlet UIImageView *avatar;
@end

@implementation GBMerchantInfoCell

- (void)awakeFromNib
{
    // Initialization code
    self.backgroundColor = CLEAR_COLOR;
    self.contentView.backgroundColor = CLEAR_COLOR;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.bgView.backgroundColor = WHITE_COLOR;
    self.bgView.clipsToBounds = YES;
    
    [self.avatar setupBorder:CLEAR_COLOR cornerRadius:10];
    
    
    for (NSInteger i = 100;i<104;i++)
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
    return 193;
}
@end
