//
//  GBProfileViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-3-20.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBProfileViewController.h"
#import "GBUserViewController.h"
#import "GBOrderViewController.h"
#import "GBScanViewController.h"
@interface GBProfileViewController ()

{
    
}

- (IBAction)userButtonClicked:(id)sender;

- (IBAction)orderButtonClicked:(id)sender;

- (IBAction)preOrderButtonClicked:(id)sender;

@end

@implementation GBProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"个人信息";
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupRightBarButtonItem];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     [(GBMainViewController *)self.tabBarController revealTabBar];
}

- (void)setupLeftBarButtonItem
{
    UIButton *scanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    scanButton.frame = RECT(0, 0, 30, 30);
    [scanButton setBackgroundImage:[UIImage imageFromMainBundleFile:@"scan.png"] forState:UIControlStateNormal];
    [scanButton addTarget:self action:@selector(scanBarCode:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:scanButton];
}

- (void)setupRightBarButtonItem
{
    UIButton *smsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    smsButton.frame = RECT(0, 0, 25, 25);
    [smsButton setBackgroundImage:[UIImage imageFromMainBundleFile:@"sms.png"] forState:UIControlStateNormal];
    [smsButton addTarget:self action:@selector(smsBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:smsButton];
}

#pragma mark - 进入个人账户
- (IBAction)userButtonClicked:(id)sender
{
    GBUserViewController *userVC = [[GBUserViewController alloc] initWithNibName:@"GBUserViewController" bundle:nil];
    [self.navigationController pushViewController:userVC animated:YES];
}

#pragma mark - 查询全部订单
- (IBAction)orderButtonClicked:(id)sender
{
    GBOrderViewController *orderVC = [[GBOrderViewController alloc] initWithNibName:@"GBOrderViewController" bundle:nil];
    [self.navigationController pushViewController:orderVC animated:YES];
}


- (IBAction)preOrderButtonClicked:(id)sender
{
    GBOrderViewController *orderVC = [[GBOrderViewController alloc] initWithNibName:@"GBOrderViewController" bundle:nil];
    [self.navigationController pushViewController:orderVC animated:YES];

}

#pragma mark - 进入二维码扫面界面
- (void)scanBarCode:(UIButton *)sender
{
    GBScanViewController *scanVC = [[GBScanViewController alloc] initWithNibName:@"GBScanViewController" bundle:nil];
    [self.navigationController pushViewController:scanVC animated:YES];
    [(GBMainViewController *)self.tabBarController hideTabBar];
}

#pragma mark - SMS
- (void)smsBtnClicked:(UIButton *)sender
{
    DLog(@"sms")
}

#pragma mark -内存管理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
