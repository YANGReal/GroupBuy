//
//  GBMyCollectionViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-6-26.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBMyCollectionViewController.h"
#import "GBMyCollectionCell.h"
@interface GBMyCollectionViewController ()<UITableViewDataSource,UITableViewDelegate,YRSegmentControlDelegate>

@property (weak , nonatomic) IBOutlet UITableView *tableView;
@property (weak , nonatomic) IBOutlet UIView *headerView;
- (IBAction)backBtnClicked:(id)sender;

@end

@implementation GBMyCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"我的收藏";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews
{
    [self hideBanner];
    [self.navigationController setNavigationBarHidden:YES];
    self.headerView.backgroundColor = NAVBAR_COLOR;
    YRSegmentControl *segmentControl = [[YRSegmentControl alloc] initWithFrame:RECT(10, 64, 300, 30) items:@[@"团购",@"票务",@"拍卖"]];
    [segmentControl setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    [segmentControl setTitleColor:C8 forState:UIControlStateSelected];
    [segmentControl setItemColor:NAVBAR_COLOR forState:UIControlStateNormal];
    [segmentControl setItemColor:WHITE_COLOR forState:UIControlStateSelected];
    segmentControl.font = [UIFont systemFontOfSize:14];
    segmentControl.borderCorner = 3;
    segmentControl.borderColor = WHITE_COLOR;
    segmentControl.delegate = self;
    [self.headerView addSubview:segmentControl];
  //  self.tableView.tableHeaderView = self.headerView;
}

- (IBAction)backBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableView Delegate and datasource method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
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
    return 108;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - YRSegmentControlDelegate method

- (void)segmentControl:(YRSegmentControl *)segment
        didSelectIndex:(NSInteger)index
{
    DLog(@"index = %d",index);
}


#pragma mark - 内存警告

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
