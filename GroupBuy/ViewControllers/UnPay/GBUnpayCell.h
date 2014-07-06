//
//  GBUnpayCell.h
//  GroupBuy
//
//  Created by YANGReal on 14-7-6.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import <UIKit/UIKit.h>


@class GBUnpayCell;

@protocol GBUnpayCellDelegate <NSObject>

@optional

- (void)payCell:(GBUnpayCell *)cell didClickPayButtonAtIndex:(NSInteger)index;

- (void)payCell:(GBUnpayCell *)cell didClickCheckedButton:(BOOL)checked;

@end

@interface GBUnpayCell : UITableViewCell

@property (assign , nonatomic) BOOL batch;
@property (assign , nonatomic) NSInteger index;
@property (assign , nonatomic) id<GBUnpayCellDelegate>delegate;
@property (assign , nonatomic) BOOL checked;
@property (assign , nonatomic) BOOL didPay;
@end
