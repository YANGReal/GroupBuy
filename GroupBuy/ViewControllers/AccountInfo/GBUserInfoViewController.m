//
//  GBUserInfoViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-6-24.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBUserInfoViewController.h"
#import "GBUpdateUserNameViewController.h"
#import "GBUpdateGenderViewController.h"
#import "GBUpdateMobileViewController.h"
#import "GBUpdatePasswordViewController.h"
#import "GBUpdateMailViewController.h"
#import "GBAccountBalanceViewController.h"
@interface GBUserInfoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak , nonatomic) IBOutlet UITableView *tableView;
@property (strong , nonatomic) NSArray *titleArray;
@property (strong , nonatomic) NSArray *itemArray;
@property (strong , nonatomic) NSArray *viewControllers;

@end

@implementation GBUserInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"账户信息";
        self.titleArray = @[@"账户设置",@"其他"];
        
        NSArray *arr1 = @[@{@"用户名":@"YANGReal"},@{@"性别":@"男"},@{@"手机号":@"186****7238"},@{@"修改密码":@""},@{@"邮箱":@"471032**@qq.com"}];
        NSArray *arr2 = @[@{@"账户余额":@"201元"}];
        
        self.itemArray = @[arr1,arr2];
       
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     [self.navigationController setNavigationBarHidden:NO];
    [self hideBanner];
    [self initViewControllers];
    // Do any additional setup after loading the view from its nib.
}


- (void)initViewControllers
{
    GBUpdateUserNameViewController *vc1 = [[GBUpdateUserNameViewController alloc] initWithNibName:@"GBUpdateUserNameViewController" bundle:nil];
    GBUpdateGenderViewController *vc2 = [[GBUpdateGenderViewController alloc] initWithNibName:@"GBUpdateGenderViewController" bundle:nil];
    GBUpdateMobileViewController *vc3 = [[GBUpdateMobileViewController alloc] initWithNibName:@"GBUpdateMobileViewController" bundle:nil];
    GBUpdatePasswordViewController *vc4 = [[GBUpdatePasswordViewController alloc] initWithNibName:@"GBUpdatePasswordViewController" bundle:nil];
    GBUpdateMailViewController *vc5 = [[GBUpdateMailViewController alloc] initWithNibName:@"GBUpdateMailViewController" bundle:nil];
    
    NSArray *arr1 = @[vc1,vc2,vc3,vc4,vc5];
    GBAccountBalanceViewController *vc6 = [[GBAccountBalanceViewController alloc] initWithNibName:@"GBAccountBalanceViewController" bundle:nil];
    NSArray *arr2 = @[vc6];
    self.viewControllers = @[arr1 ,arr2];
   // DLog(@"viewControllers = %@",_viewControllers);
    
}


#pragma mark - UITableView Delegate and Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = _itemArray[section];
    return arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:RECT(15, 0, 100, 44)];
        titleLabel.font = F5;
        titleLabel.textColor = C5;
        titleLabel.tag = 100;
        [cell.contentView addSubview:titleLabel];
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:RECT(80,0, 200, 44)];
        detailLabel.font = F5;
        detailLabel.textColor = C5;
        detailLabel.tag = 200;
        detailLabel.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:detailLabel];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    }
    NSDictionary *dict = _itemArray[indexPath.section][indexPath.row];
    UILabel *titleLabel = (UILabel *)[cell.contentView viewWithTag:100];
    UILabel *detailLabel = (UILabel *)[cell.contentView viewWithTag:200];
    titleLabel.text = dict.allKeys[0];
    detailLabel.text = dict.allValues[0];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:RECT(0, 0, 320, 30)];
    UILabel *label = [[UILabel alloc] initWithFrame:RECT(20, 0, 300, 30)];
    label.font = F4;
    label.textColor = C3;
    label.text = _titleArray[section];
    [headerView addSubview:label];
    return headerView;
}


- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (void)tableView:(UITableView *)tableView
didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSArray *arr = _viewControllers[indexPath.section];
    NBBaseViewController *vc = arr[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - 内存管理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
