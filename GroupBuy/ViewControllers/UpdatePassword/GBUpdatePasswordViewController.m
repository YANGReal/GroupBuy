//
//  GBUpdatePasswordViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-6-24.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBUpdatePasswordViewController.h"

@interface GBUpdatePasswordViewController ()

@end

@implementation GBUpdatePasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"修改密码";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self hideBanner];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
