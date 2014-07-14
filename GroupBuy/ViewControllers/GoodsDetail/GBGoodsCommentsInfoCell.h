//
//  GBGoodsCommentsInfoCell.h
//  GroupBuy
//
//  Created by YANGReal on 14-7-13.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import <UIKit/UIKit.h>


@class GBGoodsCommentsInfoCell;

@protocol GBGoodsCommentsInfoCellDelegate <NSObject>

@optional

- (void)commentsInfoCell:(GBGoodsCommentsInfoCell *)cell didClickCommentButton:(UIButton *)sender;

@end


@interface GBGoodsCommentsInfoCell : UITableViewCell
@property (assign , nonatomic) id<GBGoodsCommentsInfoCellDelegate>delegate;
+ (CGFloat)cellHeight;
@end
