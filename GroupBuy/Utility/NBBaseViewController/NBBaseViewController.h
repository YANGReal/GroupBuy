//
//  NBBaseViewController.h
//  iCareer
//
//  Created by YANGRui on 14-2-27.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NBBaseViewController : UIViewController

- (void)setupLeftBarButtonItem;
- (void)back;
- (void)hideBanner;

- (void)showMBLoding;
- (void)hideMBLoding;

- (void)showMBLodingWithMessage:(NSString *)msg;

@end
