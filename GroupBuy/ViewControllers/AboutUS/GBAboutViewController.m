//
//  GBAboutViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-8.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBAboutViewController.h"

@interface GBAboutViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak , nonatomic) IBOutlet UITableView *tableView;
@property (weak , nonatomic) IBOutlet UIView *headerView;
@property (weak , nonatomic) IBOutlet UIImageView *logo;
@property (strong , nonatomic) NSArray *titleArray;
@end

@implementation GBAboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"关于我们";
        self.titleArray = @[@"给个好评吧!让我们做的更好:)",@"团一发用户协议",@"客服电话"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)setupViews
{
    [self hideBanner];
    [self.logo setupBorder:CLEAR_COLOR cornerRadius:10];
    self.tableView.tableHeaderView = _headerView;
    self.headerView.backgroundColor = CLEAR_COLOR;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.font = F5;
    cell.textLabel.textColor = C4;
    cell.textLabel.text = _titleArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 2)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:RECT(170, 0, 200, 44)];
        label.font = F5;
        label.textColor = C8;
        label.text = @"1212-121-4546";
        [cell.contentView addSubview:label];
    }
    UIView *line = [[UIView alloc] initWithFrame:RECT(10, 43, self.view.width-20, 0.5)];
    line.backgroundColor = C2;
    [cell.contentView addSubview:line];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
