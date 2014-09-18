//
//  GBHomeCell.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-7.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBHomeCell.h"

@interface GBHomeCell ()
@property (weak , nonatomic) IBOutlet UIImageView *mediaView;
@property (weak , nonatomic) IBOutlet UIView *bgView;
@end



@implementation GBHomeCell

- (void)awakeFromNib
{
   
    // Initialization code
    self.mediaView.clipsToBounds = YES;
    self.bgView.backgroundColor = WHITE_COLOR;
    self.backgroundColor = CLEAR_COLOR;
    
    UIView *line = [[UIView alloc] initWithFrame:RECT(0, _bgView.height-2, _bgView.width, 0.5)];
    line.backgroundColor = [UIColor colorWithHexString:@"#c3c3c3"];
    [_bgView addSubview:line];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
