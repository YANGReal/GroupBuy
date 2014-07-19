//
//  GBAddGoodViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-19.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBAddGoodViewController.h"
#import "GBAddGoodCell.h"
#import "GBAddImageCell.h"

@interface GBAddGoodViewController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UITextViewDelegate,UITextFieldDelegate,UIGestureRecognizerDelegate>
@property (weak , nonatomic) IBOutlet UITableView *tableView;
@property (weak , nonatomic) IBOutlet UIView *headerView;
@property (strong , nonatomic) NSArray *itemArray;
@property (strong , nonatomic) NSMutableArray *imgArray;
@property (weak , nonatomic) IBOutlet UIView *footerView;
@property (weak , nonatomic) IBOutlet UITextView *textView;
@property (weak , nonatomic) IBOutlet UIButton *submitBtn;
@property (strong , nonatomic) UITextField *currentTextField;
@end

@implementation GBAddGoodViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.itemArray = @[@"商品名称",@"价格",@"商品类别",@"联系电话",@"地址"];
        self.imgArray = [NSMutableArray array];
        self.title = @"添加商品";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self hideBanner];
    [self setupViews];
}

- (void)setupViews
{
    self.headerView.backgroundColor = CLEAR_COLOR;
    self.tableView.tableHeaderView = self.headerView;
    self.footerView.backgroundColor = CLEAR_COLOR;
    self.tableView.tableFooterView = self.footerView;
    [self.submitBtn setupBorder:CLEAR_COLOR cornerRadius:15];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    
}

- (void)tapped:(id)sender
{
    [_currentTextField resignFirstResponder];
    [_textView resignFirstResponder];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate method

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return _itemArray.count;
    }
    else
    {
        return _imgArray.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        static NSString *identifier = @"cell";
        GBAddGoodCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"GBAddGoodCell" owner:self options:nil] lastObject];
        }
        cell.textField.delegate = self;
        cell.title = _itemArray[indexPath.row];
        return cell;
    }
    else
    {
        static NSString *identifier = @"imgCell";
        GBAddImageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"GBAddImageCell" owner:self options:nil] lastObject];
        }
        cell.image = _imgArray[indexPath.row];
        return cell;
    }
    return nil;
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.section == 1;
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.imgArray removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 55;
    }
    return 90;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
    return section*50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] initWithFrame:RECT(0, 0, self.view.width, 50)];
    UILabel *label = [[UILabel alloc] initWithFrame:RECT(10, 0, 100, 50)];
    label.textColor = C4;
    label.font = F4;
    label.text = @"上传商品图片";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
     [header addSubview:label];
    btn.frame = RECT(240, 0, 60, 50);
    btn.titleLabel.font = F4;
    [btn setTitleColor:C3 forState:UIControlStateNormal];
    [btn setTitle:@"添加图片" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(addBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [header addSubview:btn];
    header.backgroundColor = C2;
    header.tag = 100;
    return header;
}

- (void)addBtnClicked:(id)sender
{
    [self.imgArray addObject:[UIImage imageNamed:@"002.jpg"]];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1)
    {
        GBPictureViewController *vc = [[GBPictureViewController alloc] initWithNibName:@"GBPictureViewController" bundle:nil];
        vc.dataArray = _imgArray;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else
    {
        if (indexPath.row == 2)
        {
            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"全新",@"二手", nil];
            [actionSheet showInView:self.view];
        }
    }
}

#pragma mark - UIActionSheetDelegate delegate

- (void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    DLog(@"buttonIndex = %d",buttonIndex);
}

#pragma mark - UITextViewDelegate method

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.view.y = -150;
    }];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.view.y = 0;
    }];

}

#pragma mark - UITextFieldDelegate method

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
  
    self.currentTextField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    UIView *view = touch.view;
    DLog(@"view tag = %d",view.tag);
    DLog(@"view = %d",[[view subviews] count]);
    if (view.subviews.count == 2&&view.tag!=100)
    {
        return NO;
    }
    // DLog(@"view tag = %d",[view tag]);
    return YES;
}

#pragma mark - 内存管理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
