//
//  GBGoodsDetailViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-13.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBGoodsDetailViewController.h"
#import "GGoodIntroCell.h"
#import "GBGoodsRationCell.h"
#import "GBMerchantInfoCell.h"
#import "GBPackageInfoCell.h"
#import "GBGoodsRulesCell.h"
#import "GBGoodsCommentsInfoCell.h"
#import "GBCommentsViewController.h"
#import "GBSubmitOrderViewController.h"
@interface GBGoodsDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,GBShareViewDelegate,GBGoodsCommentsInfoCellDelegate>
{
    BOOL didCollection;
}
@property (weak , nonatomic) IBOutlet UITableView *tableView;
@property (weak , nonatomic) IBOutlet UIView *headerView;
@property (weak , nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak , nonatomic) IBOutlet UILabel *pageLabel;
@property (weak , nonatomic) IBOutlet UIButton *buyBtn;

- (IBAction)buyBtnClicked:(id)sender;

@end

@implementation GBGoodsDetailViewController

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
    self.tableView.tableHeaderView = self.headerView;
    self.headerView.backgroundColor = WHITE_COLOR;
    [self hideBanner];
    [self setupRightBarButtonItems];
    [self setupViews];
    // Do any additional setup after loading the view from its nib.
}

- (void)setupViews
{
    [self.buyBtn setupBorder:CLEAR_COLOR cornerRadius:18];
    NSArray *imgArr = @[@"001.jpg",@"002.jpg",@"003.jpg"];
    NSInteger count = imgArr.count;
    CGFloat width = self.view.width;
    CGFloat height = self.scrollView.height;
    self.scrollView.contentSize = CGSizeMake(width*count, height);
  
    for (NSInteger i = 0;i<count;i++)
    {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:RECT(width*i, 0, width, height)];
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        imgView.clipsToBounds = YES;
        imgView.userInteractionEnabled = YES;
        imgView.tag = i;
        imgView.image = [UIImage imageNamed:imgArr[i]];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgViewTapped:)];
        [imgView addGestureRecognizer:tap];
        [_scrollView addSubview:imgView];
    }
}

- (void)setupRightBarButtonItems
{
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    shareBtn.frame = RECT(0, 0, 25, 25);
    [shareBtn setBackgroundImage:[UIImage imageFromMainBundleFile:@"share_icon.png"] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *collectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    collectionBtn.frame = RECT(0, 0, 25, 25);
    [collectionBtn setBackgroundImage:[UIImage imageFromMainBundleFile:@"collection_normal.png"] forState:UIControlStateNormal];
    [collectionBtn setBackgroundImage:[UIImage imageFromMainBundleFile:@"collection_selected.png"] forState:UIControlStateSelected];
    [collectionBtn addTarget:self action:@selector(collectionBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:shareBtn];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithCustomView:collectionBtn];
    
    
    self.navigationItem.rightBarButtonItems = @[item2,item1];
}

- (IBAction)buyBtnClicked:(id)sender
{
    GBSubmitOrderViewController *vc = [[GBSubmitOrderViewController alloc] initWithNibName:@"GBSubmitOrderViewController" bundle:nil];
    vc.price = 18.0;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)share
{
    DLog(@"share");
    GBShareView *shareView = [[[NSBundle mainBundle] loadNibNamed:@"GBShareView" owner:self options:nil] lastObject];
    shareView.delegate = self;
    [shareView showInView:self.navigationController.view];
}
- (void)collectionBtnClicked:(UIButton *)sender
{
    DLog(@"collection");
    if (!didCollection)
    {
        sender.selected = YES;
    }
    else
    {
        sender.selected = NO;
    }
    didCollection = !didCollection;
}

- (void)imgViewTapped:(UITapGestureRecognizer *)sender
{
   // DLog(@"index = %d",sender.view.tag);
    NSArray *imgArr = @[@"001.jpg",@"002.jpg",@"003.jpg"];
    GBPictureViewController *vc = [[GBPictureViewController alloc] initWithNibName:@"GBPictureViewController" bundle:nil];
    vc.dataArray = imgArr;
    vc.currentIndex = 0;
    [self.navigationController pushViewController:vc animated:YES];
    
}


#pragma mark - UITableViewDelegate,UITableViewDataSource methods


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
      switch (indexPath.row) {
        case 0:
        {
            GGoodIntroCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"GGoodIntroCell" owner:self options:nil] lastObject];
            return cell;
        }
        case 1:
        {
            GBGoodsRationCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"GBGoodsRationCell" owner:self options:nil] lastObject];
            return cell;
        }
        case 2:
        {
            GBMerchantInfoCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"GBMerchantInfoCell" owner:self options:nil] lastObject];
            return cell;
        }
        case 3:
        {
            GBPackageInfoCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"GBPackageInfoCell" owner:self options:nil] lastObject];
            return cell;
        }
        case 4:
        {
            GBGoodsRulesCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"GBGoodsRulesCell" owner:self options:nil] lastObject];
            return cell;
        }
        case 5:
        {
            GBGoodsCommentsInfoCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"GBGoodsCommentsInfoCell" owner:self options:nil] lastObject];
            cell.delegate = self;
            return cell;
        }
          default:
          {
              return nil;
          }
    }
}


- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
           return  [GGoodIntroCell cellHeight];
        }
       case 1:
        {
            return [GBGoodsRationCell cellHeight];
        }
        case 2:
        {
            return [GBMerchantInfoCell cellHeight];
        }
        case 3:
        {
            return [GBPackageInfoCell cellHeightWithData:nil];
        }
        case 4:
        {
            return [GBGoodsRulesCell cellHeightWithData:nil];
        }
        case 5:
        {
            return [GBGoodsCommentsInfoCell cellHeight];
        }
           
    }
    return 90;
}

#pragma mark - UIScrollViewDelegate method

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == _scrollView)
    {
        NSInteger page = scrollView.contentOffset.x/scrollView.width;
        self.pageLabel.text = [NSString stringWithFormat:@"%d/3",page+1];
        DLog(@"page = %d",page);
    }
}


#pragma mark - GBShareViewDelegate method

- (void)shareView:(GBShareView *)view
didClickButtonAtIndex:(NSInteger)index
{
    DLog(@"index = %d",index);
}


#pragma mark  GBGoodsCommentsInfoCellDelegate method

- (void)commentsInfoCell:(GBGoodsCommentsInfoCell *)cell didClickCommentButton:(UIButton *)sender
{
    GBCommentsViewController *vc = [[GBCommentsViewController alloc] initWithNibName:@"GBCommentsViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark -内存管理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
