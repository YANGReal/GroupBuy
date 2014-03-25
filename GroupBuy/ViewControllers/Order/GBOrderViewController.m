//
//  GBOrderViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-3-25.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBOrderViewController.h"
#import "GBOrderCell.h"
#import "GBOrderDetailViewController.h"
@interface GBOrderViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *_tableView;
}
@end

@implementation GBOrderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"全部订单";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [(GBMainViewController *)self.tabBarController hideTabBar];
    // Do any additional setup after loading the view from its nib.
}



#pragma mark - UITableView datasource and delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    GBOrderCell *cell = (GBOrderCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GBOrderCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GBOrderDetailViewController *detailVC = [[GBOrderDetailViewController alloc] initWithNibName:@"GBOrderDetailViewController" bundle:nil];
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - 内存管理

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
