//
//  GBMessageViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-6-19.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBMessageViewController.h"
#import "GBMessageCell.h"
@interface GBMessageViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    BOOL isSystem;
}
@property (weak , nonatomic) IBOutlet UITableView *tableView;
@property (weak , nonatomic) IBOutlet UIView *headerView;
@property (weak , nonatomic) IBOutlet UIButton *systemBtn;
@property (weak , nonatomic) IBOutlet UIButton *userBtn;
@property (weak , nonatomic) IBOutlet UILabel *promptLabel;
@property (strong , nonatomic) NSMutableArray *systemMessage;
@property (strong , nonatomic) NSMutableArray *userMessage;


- (IBAction)btnClicked:(id)sender;

@end

@implementation GBMessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"消息";
        isSystem = YES;
        self.systemMessage = [@[@1,@2,@3,@4,@5] mutableCopy];
        self.userMessage = [NSMutableArray array];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
    // Do any additional setup after loading the view from its nib.
}

- (void)setupViews
{
    [self hideBanner];
    self.headerView.backgroundColor = WHITE_COLOR;
    self.headerView.y = 64;
    self.systemBtn.selected = YES;
    self.promptLabel.hidden = YES;
    [self.navigationController setNavigationBarHidden:NO];
}

- (IBAction)btnClicked:(id)sender
{
    if (sender == _systemBtn)
    {
        isSystem = YES;
        self.tableView.hidden = NO;
        _systemBtn.selected = YES;
        _userBtn.selected = NO;
        self.promptLabel.hidden = YES;
    }
    else
    {
        self.tableView.hidden = YES;
        isSystem = NO;
        self.promptLabel.hidden = NO;
        _systemBtn.selected = NO;
        _userBtn.selected = YES;
    }
    [self.tableView reloadData];
}


#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    
    return isSystem == YES?_systemMessage.count:_userMessage.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    GBMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GBMessageCell" owner:self options:nil] lastObject];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 96;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
    return 7;
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
