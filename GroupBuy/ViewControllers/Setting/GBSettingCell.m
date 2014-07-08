//
//  GBSettingCell.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-8.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBSettingCell.h"


@interface GBSettingCell ()

@property (weak , nonatomic) IBOutlet UILabel *titleLabel;
@property (weak , nonatomic) IBOutlet UILabel *descLabel;
@property (weak , nonatomic) IBOutlet UISwitch *switcher;
@end

@implementation GBSettingCell

- (void)awakeFromNib
{
    // Initialization code
    UIView *line = [[UIView alloc] initWithFrame:RECT(10, 43, self.width-20, 0.5)];
    line.backgroundColor = C2;
    [self.contentView addSubview:line];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.text = _data[@"title"];
    self.switcher.hidden = [_data[@"switch"] boolValue];
    self.descLabel.text = _data[@"desc"];
    self.descLabel.hidden = [_data[@"subTitle"] boolValue];
    if ([_data[@"accessoryType"] boolValue])
    {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else
    {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
