//
//  GBProfileViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-3-20.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBProfileViewController.h"
#import "GBSettingViewController.h"
#import "GBLoginViewController.h"
#import "GBScanViewController.h"
#import "GBMessageViewController.h"
#import "GBUserInfoViewController.h"
#import "GBMyCollectionViewController.h"
#import "GBUnpayViewController.h"
@interface GBProfileViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak , nonatomic) IBOutlet UITableView *tableView;
@property (weak , nonatomic) IBOutlet UIView *headerView;
@property (strong , nonatomic) NSArray *configData;
@property (nonatomic, weak) IBOutlet UIButton *loginBtn;
@property (nonatomic, assign) BOOL isLogined;
@property (nonatomic, assign) IBOutlet UIView *loginedView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *balanceLabel;

- (IBAction)gotoUserInfo:(id)sender;

- (IBAction)loginBtnClicked:(id)sender;

@end

@implementation GBProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSDictionary *dict1 = @{@"title": @"我的收藏",@"img":@"my_collection.png"};
        NSDictionary *dict2 = @{@"title": @"代付款",@"img":@"unpay.png"};
        NSDictionary *dict3 = @{@"title": @"已付款",@"img":@"paid.png"};
        NSArray *arr1 = @[dict1];
        NSArray *arr2 = @[dict2,dict3];
        self.configData = @[arr1,arr2];
        
//        self.isLogined = [AppUtility getBoolForkey:DID_LOGIN];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
    [self setupLeftBarButtonItem];
    [self setupRightBarButtonItem];
   // [self.navigationController setNavigationBarHidden:YES animated:NO];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeUiStatus) name:LOGIN_STATUS object:nil];
}

- (void)setupViews
{
    self.tableView.y = 64;
    self.tableView.tableHeaderView = self.headerView;
    self.headerView.backgroundColor = CLEAR_COLOR;
    [self.loginBtn setBackgroundColor:C6];
    [self.loginBtn.layer setBorderWidth:2.0f];
    [self.loginBtn.layer setBorderColor:C8.CGColor];
    [self.loginBtn.layer setCornerRadius:25];
    
    [self changeUiStatus];
}

- (void)changeUiStatus
{
    self.isLogined = [AppUtility getBoolForkey:DID_LOGIN];
    if (_isLogined)
    {
        [self.loginedView setHidden:NO];
        [self.loginBtn setHidden:YES];
        [self.nameLabel setText:[AppUtility getObjectForKey:USER_NAME]];
        [self.balanceLabel setText:[NSString stringWithFormat:@"账户余额:%@", [AppUtility getObjectForKey:BALANCE]]];
    }
    else
    {
        [self.loginedView setHidden:YES];
        [self.loginBtn setHidden:NO];
    }
}

- (void)setupLeftBarButtonItem
{
    UIButton *msgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    msgBtn.frame = RECT(15, 30, 25, 25);
    [msgBtn setBackgroundImage:[UIImage imageFromMainBundleFile:@"profile_msg.png"] forState:UIControlStateNormal];
    [msgBtn addTarget:self action:@selector(msgBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:msgBtn];
    //[self.view bringSubviewToFront:scanButton];
}

- (void)setupRightBarButtonItem
{
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    settingBtn.frame = RECT(self.view.width-25-15, 30, 25, 25);
    [settingBtn setBackgroundImage:[UIImage imageFromMainBundleFile:@"profile_setting.png"] forState:UIControlStateNormal];
    [settingBtn addTarget:self action:@selector(settingBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:settingBtn];
}

#pragma mark - 登录

- (IBAction)loginBtnClicked:(id)sender
{
    GBLoginViewController *lVC = [[GBLoginViewController alloc] initWithNibName:@"GBLoginViewController" bundle:nil];
    [self.navigationController pushViewController:lVC animated:YES];
}

#pragma mark - 进入个人账户
- (IBAction)gotoUserInfo:(id)sender
{
    GBUserInfoViewController *userInfoVC = [[GBUserInfoViewController alloc] initWithNibName:@"GBUserInfoViewController" bundle:nil];
    [self.navigationController pushViewController:userInfoVC animated:YES];
}


#pragma mark - 进入通知界面
- (void)msgBtnClicked:(UIButton *)sender
{
    GBMessageViewController *messageVC = [[GBMessageViewController alloc] initWithNibName:@"GBMessageViewController" bundle:nil];
    [self.navigationController pushViewController:messageVC animated:YES];
}

#pragma mark - 进入设置界面
- (void)settingBtnClicked:(UIButton *)sender
{
    GBSettingViewController *settingVC = [[GBSettingViewController alloc] initWithNibName:@"GBSettingViewController" bundle:nil];
    [self.navigationController pushViewController:settingVC animated:YES];
}

#pragma mark - UITableView delegate method 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return section+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    NSArray *arr = _configData[indexPath.section];
    NSDictionary *data = arr[indexPath.row];
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:RECT(15, 9, 25, 25)];
    NSString *img = data[@"img"];
    iconView.image = [UIImage imageFromMainBundleFile:img];
    [cell.contentView addSubview:iconView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:RECT(45, 0, 100, 43)];
    label.textColor = C4;
    label.font = F5;
    label.text = data[@"title"];
    [cell.contentView addSubview:label];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 16;
    }
    return 32;
}


- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section
{
    if (section == 1)
    {
        UIView *headerView = [[UIView alloc] initWithFrame:RECT(0, 0, 320, 32)];
        UILabel *label = [[UILabel alloc] initWithFrame:RECT(15, 0, 100, 32)];
        label.text = @"订单";
        label.textColor = C3;
        label.font = F4;
        [headerView addSubview:label];
        return headerView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 43;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        GBMyCollectionViewController *collectionVC = [[GBMyCollectionViewController alloc] initWithNibName:@"GBMyCollectionViewController" bundle:nil];
        [self.navigationController pushViewController:collectionVC animated:YES];
        
    }
    if (indexPath.section == 1&&indexPath.row == 0)
    {
        GBUnpayViewController *unPayVC = [[GBUnpayViewController alloc] initWithNibName:@"GBUnpayViewController" bundle:nil];
        [self.navigationController pushViewController:unPayVC animated:YES];
        
    }
    if (indexPath.section == 1&&indexPath.row == 1)
    {
        
        GBUnpayViewController *unPayVC = [[GBUnpayViewController alloc] initWithNibName:@"GBUnpayViewController" bundle:nil];
        unPayVC.didPay = YES;
        [self.navigationController pushViewController:unPayVC animated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -内存管理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
