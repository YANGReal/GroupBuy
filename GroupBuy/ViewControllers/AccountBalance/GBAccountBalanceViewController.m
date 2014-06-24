//
//  GBAccountBalanceViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-6-24.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBAccountBalanceViewController.h"

@interface GBAccountBalanceViewController ()

@end

@implementation GBAccountBalanceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"账户余额";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self hideBanner];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
