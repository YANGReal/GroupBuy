//
//  GBMerchantViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-3-20.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBGroupbuyViewController.h"

@interface GBGroupbuyViewController ()<DropDownChooseDataSource,DropDownChooseDelegate>
@property (strong , nonatomic) NSArray *itemArray;

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
    // Do any additional setup after loading the view from its nib.
}

- (void)setupViews
{
    DropDownListView * dropDownView = [[DropDownListView alloc] initWithFrame:CGRectMake(0,84, self.view.frame.size.width, 40) dataSource:self delegate:self];
    dropDownView.mSuperView = self.view;
    dropDownView.backgroundColor = self.view.backgroundColor;
    [self.view insertSubview:dropDownView atIndex:0];
}

- (void)setupLeftBarButtonItem
{
    //Do nothing
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

#pragma mark - 内存管理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
