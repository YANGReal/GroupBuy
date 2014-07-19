//
//  GBPictureViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-14.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBPictureViewController.h"

@interface GBPictureViewController ()<SwipeViewDataSource,SwipeViewDelegate>

@property (strong , nonatomic)  SwipeView  *swipView;
@property (weak , nonatomic) IBOutlet UILabel *countLabel;
@end

@implementation GBPictureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"图片浏览";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self hideBanner];
    [self setupViews];
    // Do any additional setup after loading the view from its nib.
}

- (void)setupViews
{
    self.swipView = [[SwipeView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    _swipView.dataSource = self;
    _swipView.delegate = self;
    _swipView.alignment = SwipeViewAlignmentCenter;
    _swipView.pagingEnabled = YES;
    _swipView.wrapEnabled = YES;
    _swipView.itemsPerPage = 1;
    _swipView.truncateFinalPage = YES;
    _swipView.backgroundColor = BLACK_COLOR;
    [self.view addSubview:_swipView];
    [self.view bringSubviewToFront:_countLabel];
    self.countLabel.text = [NSString stringWithFormat:@"%d/%d",_currentIndex+1,_dataArray.count];
    //[self.navigationController setNavigationBarHidden:YES];
}

#pragma mark - SwipeViewDataSource,SwipeViewDelegate method

- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView
{
    return _dataArray.count;
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    YRZoomingView *zoomingView = (YRZoomingView *)view;
    if (zoomingView == nil)
    {
        zoomingView = [[YRZoomingView alloc] initWithFrame:swipeView.bounds];
        
    }
    zoomingView.contentMode = UIViewContentModeScaleAspectFit;
    zoomingView.tag = index;
    
    if ([_dataArray[0] isKindOfClass:[UIImage class]])
    {
        zoomingView.imgView.image =_dataArray[index];
    }
    else
    {
        zoomingView.imgView.image = [UIImage imageNamed:_dataArray[index]];

    }
    return zoomingView;
    
}

- (void)swipeViewCurrentItemIndexDidChange:(SwipeView *)swipeView
{
    _currentIndex = swipeView.currentItemIndex;
}


- (void)swipeViewDidEndDecelerating:(SwipeView *)swipeView
{
     NSInteger index = swipeView.currentPage;
      YRZoomingView *view = (YRZoomingView *)[swipeView itemViewAtIndex:index];
    // DLog(@"view = %@",[view class]);
    [view setZoomScale:1.0 animated:YES];
    _currentIndex = swipeView.currentItemIndex;
    self.countLabel.text = [NSString stringWithFormat:@"%d/%d",_currentIndex+1,_dataArray.count];
    
}



#pragma mark - 内存管理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
