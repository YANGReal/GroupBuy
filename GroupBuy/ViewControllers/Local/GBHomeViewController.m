//
//  GBLocalViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-3-20.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBHomeViewController.h"
#import "GBOrderViewController.h"
#import "GBHomeCell.h"
#import "GBScanViewController.h"
#import "GBSearchViewController.h"
@interface GBHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak , nonatomic) IBOutlet UITableView *tableView;
@property (weak , nonatomic) IBOutlet UIView *headerView;

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
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
    [self setLeftButton];
    [self setRightButton];
    
    
}

- (void)setupViews
{
    self.headerView.backgroundColor = CLEAR_COLOR;
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.y = 64;
    self.tableView.height = self.view.height-64-49;
}

- (void)setLeftButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = RECT(15, 30, 25, 25);
    [button setBackgroundImage:[UIImage imageFromMainBundleFile:@"barCode.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(barCodeClicked) forControlEvents:UIControlEventTouchUpInside];
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

- (void)barCodeClicked
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

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    GBHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GBHomeCell" owner:self options:nil] lastObject];
    }
   
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 96;
}

#pragma mark - 内存管理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
