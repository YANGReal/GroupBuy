//
//  GBUnpayCell.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-6.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBUnpayCell.h"


@interface GBUnpayCell ()
@property (weak , nonatomic) IBOutlet UIView *bgView1,*bgView2;
@property (weak , nonatomic) IBOutlet UIButton *checkBtn;
@property (weak , nonatomic) IBOutlet UIImageView *mediaView;
@property (weak , nonatomic) IBOutlet UIButton *payBtn;

- (IBAction)checkBtnClicked:(id)sender;

- (IBAction)payBtnClicked:(id)sender;

@end

@implementation GBUnpayCell

- (void)awakeFromNib
{
    // Initialization code
    self.bgView2.backgroundColor = WHITE_COLOR;
    self.bgView1.backgroundColor = WHITE_COLOR;
    self.mediaView.clipsToBounds = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = CLEAR_COLOR;
  

}

- (IBAction)checkBtnClicked:(id)sender
{
     _checked = !_checked;
     _checkBtn.selected = _checked;
    if ([self.delegate respondsToSelector:@selector(payCell:didClickCheckedButton:)])
    {
        [self.delegate payCell:self didClickCheckedButton:_checked];
    }
   
}

- (IBAction)payBtnClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(payCell:didClickPayButtonAtIndex:)])
    {
        [self.delegate payCell:self didClickPayButtonAtIndex:_index];
    }
}

- (void)layoutSubviews
{
    if (_batch)
    {
        [UIView animateWithDuration:0.3 animations:^{
            
            self.bgView2.x = 50;
        }];
    }
    
    
    self.checkBtn.selected = _checked;
    
  
    
    _payBtn.hidden = _didPay;
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
