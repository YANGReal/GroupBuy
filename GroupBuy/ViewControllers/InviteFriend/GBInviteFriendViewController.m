//
//  GBInviteFriendViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-8.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBInviteFriendViewController.h"

@interface GBInviteFriendViewController ()

@end

@implementation GBInviteFriendViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"邀请好友使用";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
    // Do any additional setup after loading the view from its nib.
}


- (void)setupViews
{
    [self hideBanner];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}


@end
