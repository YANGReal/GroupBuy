//
//  GBUnpayViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-6.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBUnpayViewController.h"
#import "GBUnpayCell.h"
@interface GBUnpayViewController ()<UITableViewDataSource,UITableViewDelegate,YRSegmentControlDelegate,GBUnpayCellDelegate>
{
    BOOL batch;
}
@property (weak , nonatomic) IBOutlet UITableView *tableView;
@property (weak , nonatomic) IBOutlet UIView *headerView;
@property (weak , nonatomic) IBOutlet UIButton *batchBtn;
@property (weak , nonatomic) IBOutlet UIButton *payBtn;
@property (weak , nonatomic) IBOutlet UIView *bottomView;

@property (strong , nonatomic) NSMutableDictionary *flagDict;


- (IBAction)backBtnClicked:(id)sender;

- (IBAction)batchPayBtnClicked:(id)sender;

@end

@implementation GBUnpayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"待付款";
        self.flagDict = [NSMutableDictionary dictionary];
        for (NSInteger i = 0;i<8;i++)
        {
            [self.flagDict setObject:@(NO) forKey:@(i)];
        }
       
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
    _batchBtn.tag = 100;
    [self.payBtn setupBorder:CLEAR_COLOR cornerRadius:10];
    self.bottomView.alpha = 0;
    self.bottomView.backgroundColor = WHITE_COLOR;
    if(_didPay)
    {
        self.title = @"已付款";
        self.batchBtn.hidden = YES;
    }
    
}

- (IBAction)backBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)batchPayBtnClicked:(id)sender
{
    if (_batchBtn.tag == 100)
    {
        batch = YES;
        [self.batchBtn setTitle:@"全选" forState:UIControlStateNormal];
        _batchBtn.tag = 200;
        [_tableView reloadData];
        return;
    }
    if (_batchBtn.tag == 200)
    {
        [self.batchBtn setTitle:@"取消全选" forState:UIControlStateNormal];
        [self checkAll:YES];
        _batchBtn.tag = 300;
        return;
    }
    if (_batchBtn.tag == 300)
    {
        [self.batchBtn setTitle:@"全选" forState:UIControlStateNormal];
        _batchBtn.tag = 200;
        [self checkAll:NO];
        return;
    }
}

- (void)checkAll:(BOOL)check
{
    for (NSInteger i = 0;i<8;i++)
    {
        [_flagDict setObject:@(check) forKey:@(i)];
    }
    [_tableView reloadData];
    [self showBottomView:check];
}

- (void)showBottomView:(BOOL)show
{
    [UIView animateWithDuration:0.3 animations:^{
        
        _bottomView.alpha = show;
    }];
}

- (BOOL)didCheckOneItem
{
    for (NSNumber *num in _flagDict.allValues)
    {
        if (num.boolValue)
        {
            return YES;
        }
    }
    return NO;
}

#pragma mark - UITableView Delegate and datasource method

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    GBUnpayCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GBUnpayCell" owner:self options:nil] lastObject];
        cell.delegate = self;
    }
    cell.checked = [_flagDict[@(indexPath.row)] boolValue];
    cell.index = indexPath.row;
    cell.batch = batch;
    cell.didPay = _didPay;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 111;
}


#pragma mark - YRSegmentControlDelegate method

- (void)segmentControl:(YRSegmentControl *)segment
        didSelectIndex:(NSInteger)index
{
   

}

#pragma mark - GBUnpayCellDelegate method

- (void)payCell:(GBUnpayCell *)cell
didClickCheckedButton:(BOOL)checked
{
    NSInteger index = cell.index;
    [_flagDict setObject:@(checked) forKey:@(index)];
    
    [self showBottomView: [self didCheckOneItem]];
}

- (void)payCell:(GBUnpayCell *)cell
didClickPayButtonAtIndex:(NSInteger)index
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
