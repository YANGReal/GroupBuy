//
//  GBUserViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-3-25.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBUserViewController.h"

@interface GBUserViewController ()
{
    IBOutlet UITextField *mailField;
    IBOutlet UITextField *phoneField;
    
    
}
@end

@implementation GBUserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"个人账户";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    mailField.text = @"1234@me.com";
    phoneField.text = @"13888888888";
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    [(GBMainViewController *)self.tabBarController hideTabBar];
    // Do any additional setup after loading the view from its nib.
}


#pragma mark - 隐藏键盘

- (void)hideKeyboard
{
    [mailField resignFirstResponder];
    [phoneField resignFirstResponder];
}


#pragma mark - 内存管理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
