//
//  GBMerchantViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-3-20.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBGroupbuyViewController.h"
#import "GBMyCollectionCell.h"
#import "GBSearchViewController.h"
@interface GBGroupbuyViewController ()<DropDownChooseDataSource,DropDownChooseDelegate,UITableViewDataSource,UITableViewDelegate>
@property (strong , nonatomic) NSArray *itemArray;
@property (weak , nonatomic) IBOutlet UITableView *tableView;
@end

@implementation GBGroupbuyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"商家";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.itemArray = @[@[@"全部分类",@"美食",@"生活",@"娱乐"],
                       @[@"全城",@"士嘉宝",@"列治文山",@"北约克",@"万锦",@"多伦多市区",@"密西加沙"],
                       @[@"默认排序",@"价格",@"距离",@"人气",@"最新",@"评价"]];
    [self setupViews];
    [self setRightButton];
    // Do any additional setup after loading the view from its nib.
}

- (void)setupViews
{
    DropDownListView * dropDownView = [[DropDownListView alloc] initWithFrame:CGRectMake(0,84, self.view.frame.size.width, 40) dataSource:self delegate:self];
    dropDownView.mSuperView = self.view;
    dropDownView.backgroundColor = self.view.backgroundColor;
    [self.view insertSubview:dropDownView atIndex:0];
    self.tableView.y = dropDownView.y+dropDownView.height;
    self.tableView.height = self.view.height-49-self.tableView.y;
}

- (void)setupLeftBarButtonItem
{
    //Do nothing
}
- (void)setRightButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = RECT(self.view.width-25-15, 30, 25, 25);
    [button setBackgroundImage:[UIImage imageFromMainBundleFile:@"search_icon.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(searchBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)searchBtnClicked
{
    GBSearchViewController *vc = [[GBSearchViewController alloc] initWithNibName:@"GBSearchViewController" bundle:nil];
    [self .navigationController pushViewController:vc animated:YES];
}

#pragma mark - DropDownChooseDataSource,DropDownChooseDelegate method


- (NSInteger)numberOfSections
{
    return 3;
}


- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = _itemArray[section];
    return arr.count;
}

- (NSString *)titleInSection:(NSInteger)section index:(NSInteger) index
{
    return _itemArray[section][index];
}
- (NSInteger)defaultShowSection:(NSInteger)section
{
    return 0;
}

- (UIImage *)iconInSection:(NSInteger)section
{
    NSArray *arr = @[@"all_cate_icon.png",
                     @"all_city_icon.png",
                     @"sort_icon.png"];
    return [UIImage imageFromMainBundleFile:arr[section]];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    GBMyCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GBMyCollectionCell" owner:self options:nil] lastObject];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 94;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GBGoodsDetailViewController *vc = [[GBGoodsDetailViewController alloc] initWithNibName:@"GBGoodsDetailViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark - 内存管理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
