//
//  GBLocalViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-3-20.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBHomeViewController.h"
#import "GBSpecialCell.h"
#import "GBHomeCell.h"
#import "GBScanViewController.h"
#import "GBSearchViewController.h"
#import "GBGoodsDetailViewController.h"
#import "GBHomeSectionView.h"
#import "GBHomeSectionFooterView.h"
@interface GBHomeViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (weak , nonatomic) IBOutlet UITableView *tableView;
@property (weak , nonatomic) IBOutlet UIView *headerView;
@property (weak , nonatomic) IBOutlet UIView *searchView;
@property (weak , nonatomic) IBOutlet UITextField *searchField;
@property  (weak , nonatomic) IBOutlet UIImageView *coverImageView;
@property (strong , nonatomic) NSArray *sectionArray;
- (IBAction)barCodeClicked:(id)sender;
//- (IBAction)barCodeBtnClicked:(id)sender;
//
//- (IBAction)searchBtnClicked:(id)sender;

@end

@implementation GBHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.sectionArray = @[@"专题活动",@"社团A",@"推荐社团"];
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
    //[self setLeftButton];
    [self setRightButton];
    
    
}

- (void)setupViews
{
    self.headerView.backgroundColor = CLEAR_COLOR;
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.y = 64;
    self.tableView.height = self.view.height-64-49;
    [self.searchView setupBorder:WHITE_COLOR cornerRadius:18];
    self.coverImageView.clipsToBounds = YES;
    
}

- (void)setLeftButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = RECT(15, 30, 25, 25);
    [button setBackgroundImage:[UIImage imageFromMainBundleFile:@"barCode.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(barCodeClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)setRightButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = RECT(self.view.width-25-15, 30, 25, 25);
    [button setBackgroundImage:[UIImage imageFromMainBundleFile:@"search_icon.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(searchBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (IBAction)barCodeClicked:(id)sender
{
    GBScanViewController *vc = [[GBScanViewController alloc] initWithNibName:@"GBScanViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)searchBtnClicked
{
    GBSearchViewController *vc = [[GBSearchViewController alloc] initWithNibName:@"GBSearchViewController" bundle:nil];
    [self .navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource method

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        static NSString *identifier = @"specialCell";
        GBSpecialCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"GBSpecialCell" owner:self options:nil] lastObject];
        }
        
        return cell;

        
    }
    static NSString *identifier = @"cell";
    GBHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GBHomeCell" owner:self options:nil] lastObject];
    }
   
    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GBGoodsDetailViewController *detailVC = [[GBGoodsDetailViewController alloc] initWithNibName:@"GBGoodsDetailViewController" bundle:nil];
    detailVC.title = @"详情";
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 123;
    }
    return 62;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    GBHomeSectionView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"GBHomeSectionView" owner:self options:nil]
                                     lastObject];
    headerView.title = _sectionArray[section];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 41;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    GBHomeSectionFooterView *footerView = [[[NSBundle mainBundle] loadNibNamed:@"GBHomeSectionFooterView" owner:self options:nil] lastObject];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 53;
}

#pragma mark - UITextFieldDelegate method

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - 内存管理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
