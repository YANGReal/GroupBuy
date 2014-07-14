//
//  GBCommentsViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-14.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBCommentsViewController.h"
#import "GBCommentsCell.h"
@interface GBCommentsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak , nonatomic) IBOutlet UITableView *tableView;
@end

@implementation GBCommentsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"评论";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self hideBanner];
    [self setupRightBarButtonItem];
    // Do any additional setup after loading the view from its nib.
}

- (void)setupRightBarButtonItem
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = RECT(0, 0, 40, 40);
    [btn setTitle:@"评论" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(rightBarButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

- (void)rightBarButtonClicked
{
    
}


#pragma mark - UITableViewDataSource,UITableViewDelegate methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identfier = @"cell";
    GBCommentsCell *cell = [tableView dequeueReusableCellWithIdentifier:identfier];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GBCommentsCell" owner:self options:nil] lastObject];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - 内存管理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
