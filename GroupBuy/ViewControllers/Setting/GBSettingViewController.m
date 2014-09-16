//
//  GBSettingViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-8.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBSettingViewController.h"
#import "GBSettingCell.h"
#import "GBAboutViewController.h"
#import "GBFeedbackViewController.h"
#import "GBInviteFriendViewController.h"
@interface GBSettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak , nonatomic) IBOutlet UITableView *tableView;
@property (strong , nonatomic) NSArray *dataArray;
@property (nonatomic, weak) IBOutlet UIView *footerView;
@property (nonatomic, weak) IBOutlet UIButton *logoutBtn;

- (IBAction)logout:(id)sender;

@end

@implementation GBSettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"设置";
        NSArray *arr1 = @[@{@"title":@"消息提示",@"switch":@(NO),@"desc":@"",@"subTitle":@(YES),@"accessoryType":@(NO)},
                          @{@"title":@"非WiFi下使用无图模式",@"switch":@(NO),@"desc":@"",@"subTitle":@(YES),@"accessoryType":@(NO)},
                          @{@"title":@"邀请好友使用",@"switch":@(YES),@"desc":@"",@"subTitle":@(YES),@"accessoryType":@(YES)}];
        NSArray *arr2 = @[@{@"title":@"支持帮助",@"switch":@(YES),@"desc":@"",@"subTitle":@(YES),@"accessoryType":@(YES)},
                          @{@"title":@"意见反馈",@"switch":@(YES),@"desc":@"",@"subTitle":@(YES),@"accessoryType":@(YES)},
                          @{@"title":@"检查更新",@"switch":@(YES),@"desc":@"版本号:v1.0",@"subTitle":@(NO),@"accessoryType":@(NO)},
                          @{@"title":@"关于我们",@"switch":@(YES),@"desc":@"",@"subTitle":@(YES),@"accessoryType":@(YES)}];
        self.dataArray = @[arr1,arr2];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
    [self setupLeftBarButtonItem];
    // Do any additional setup after loading the view from its nib.
}

- (void)setupViews
{
    self.tableView.y = 64;
    self.tableView.height = self.view.height-64;
    
    [self.logoutBtn setBackgroundColor:[UIColor redColor]];
    [self.logoutBtn.layer setCornerRadius:20];
    [self.logoutBtn.layer setBorderColor:C8.CGColor];
    [self.logoutBtn.layer setBorderWidth:2.0f];
    
    [self.tableView setTableFooterView:_footerView];
    

    if ([AppUtility getBoolForkey:DID_LOGIN]) {
        [self.footerView setHidden:NO];
    }
}

- (void)setupLeftBarButtonItem
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = RECT(15, 30, 12, 20);
    [backBtn setBackgroundImage:[UIImage imageFromMainBundleFile:@"back.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    //[self.view bringSubviewToFront:scanButton];
}

- (void)backBtnClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)logout:(id)sender
{
    [AppUtility setBool:NO forkey:DID_LOGIN];
    [AppUtility storeObject:@"" forKey:UID];
    [AppUtility storeObject:@"" forKey:USER_NAME];
    [AppUtility storeObject:@"" forKey:BALANCE];
    [[NSNotificationCenter defaultCenter] postNotificationName:LOGIN_STATUS object:nil];
    
    [self backBtnClicked];
}


#pragma mark - <UITableViewDataSource,UITableViewDelegate>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return section == 0?3:4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    GBSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GBSettingCell"
                                              owner:self
                                            options:nil] lastObject];
    }
    NSArray *arr = _dataArray[indexPath.section];
    cell.data = arr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section
{
    NSArray *titleArray = @[@"设置",@"其他"];
    UIView *view = [[UIView alloc] initWithFrame:RECT(0, 0, self.view.width, 30)];
    UILabel *label = [[UILabel alloc] initWithFrame:RECT(10, 0, 100, 30)];
    label.textColor = C3;
    label.font = F4;
    label.text = titleArray[section];
    [view addSubview:label];
    return view;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1&&indexPath.row == 1)
    {
        GBFeedbackViewController *feedbackVC = [[GBFeedbackViewController alloc] initWithNibName:@"GBFeedbackViewController" bundle:nil];
        [self.navigationController pushViewController:feedbackVC animated:YES];
        return;
    }
    
    if (indexPath.row == 3)
    {
        GBAboutViewController *aboutVC = [[GBAboutViewController alloc] initWithNibName:@"GBAboutViewController" bundle:nil];
        [self.navigationController pushViewController:aboutVC animated:YES];
        return;
    }
    if (indexPath.section == 0&&indexPath.row == 2)
    {
        GBInviteFriendViewController *inviteVC = [[GBInviteFriendViewController alloc] initWithNibName:@"GBInviteFriendViewController" bundle:nil];
        [self.navigationController pushViewController:inviteVC animated:YES];
    }
}


#pragma mark - 内存管理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
