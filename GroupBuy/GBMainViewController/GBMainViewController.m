//
//  GBMainViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-3-20.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBMainViewController.h"
#import "GBLocalViewController.h"
#import "GBTicketViewController.h"
#import "GBMerchantViewController.h"
#import "GBProfileViewController.h"
#import "GBMoreViewController.h"



@interface GBMainViewController ()

@property (strong , nonatomic) UIView *myTabBar;
@property (strong , nonatomic) NSArray *titleArray;
@end

@implementation GBMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"团一发";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTabBar];
    [self setupViewControllers];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}


#pragma mark - 自定义UITabBar
/*自定义UITabBar*/
- (void)setupTabBar
{
    CGFloat iconSpace = 34;
    CGRect rect = [[UIScreen mainScreen] bounds];
    self.myTabBar = [[UIView alloc] initWithFrame:RECT(0, DEVICE_HEIGHT-49, DEVICE_WIDTH, 49)];
    self.myTabBar.backgroundColor = WHITE_COLOR;
    [self.view addSubview:self.myTabBar];
    self.titleArray = @[@"主页",@"团购",@"票务",@"拍卖",@"个人信息"];
    NSArray *iconArr1 = @[@"home.png",@"group.png",@"ticket.png",@"auction.png",@"profile.png"];
    NSArray *iconArr2 = @[@"home_s.png",@"group_s.png",@"ticket_s.png",@"auction_s.png",@"profile_s.png"];
    CGFloat btnWidth = rect.size.width/5.0;
    for (int i = 0;i<5;i++)
    {
        UIImageView *iconView = [[UIImageView alloc] initWithFrame:RECT(18+30*i+iconSpace*i, 5, 30,30)];
        iconView.tag = 100 + i;
        iconView.image = [UIImage imageFromMainBundleFile:iconArr1[i]];
        iconView.highlightedImage = [UIImage imageFromMainBundleFile:iconArr2[i]];
              [self.myTabBar addSubview:iconView];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i + 100;
        button.frame = RECT(i*btnWidth, 0, btnWidth, 49);
        [button addTarget:self action:@selector(tabBarTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.myTabBar addSubview:button];
      
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:RECT(btnWidth*i, 30, btnWidth, 20)];
        titleLabel.font = F2;
        titleLabel.textColor = C3;
        if (i == 0)
        {
            iconView.highlighted = YES;
            titleLabel.textColor = C6;
        }
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = _titleArray[i];
        titleLabel.tag = i+100;
        [self.myTabBar addSubview:titleLabel];
    }
    self.view.backgroundColor = BG_COLOR;
}

#pragma mark - 设置UITabBarController的子视图控制器

- (void)setupViewControllers
{
    GBLocalViewController *localVC = [[GBLocalViewController alloc] initWithNibName:@"GBLocalViewController" bundle:nil];
    localVC.title = @"团一发";
    GBTicketViewController *ticketVC = [[GBTicketViewController alloc] initWithNibName:@"GBTicketViewController" bundle:nil];
    ticketVC.title = @"团购";
    
    GBMerchantViewController *merchantVC = [[GBMerchantViewController alloc] initWithNibName:@"GBMerchantViewController" bundle:nil];
    
    GBMoreViewController *moreVC = [[GBMoreViewController alloc] initWithNibName:@"GBMoreViewController" bundle:nil];
    

    GBProfileViewController *profileVC = [[GBProfileViewController alloc] initWithNibName:@"GBProfileViewController" bundle:nil];
    
    self.viewControllers = @[localVC,ticketVC,merchantVC,moreVC,profileVC];
}


#pragma mark - 点击tabBar时候调用
- (void)tabBarTapped:(UIButton *)sender
{
    NSInteger index = sender.tag - 100;
    self.selectedIndex = index;
    
    for (UIView *view in self.myTabBar.subviews)
    {
        if ([view isKindOfClass:[UIImageView class]])
        {
            UIImageView *icon = (UIImageView *)view;
           
            if (icon.tag == sender.tag)
            {
                icon.highlighted = YES;
            }
            else
            {
                icon.highlighted = NO;
            }
        }
        
        if ([view isKindOfClass:[UILabel class]])
        {
            UILabel *label = (UILabel *)view;
            if (label.tag == sender.tag)
            {
                label.textColor = C6;
            }
            else
            {
                label.textColor = C3;
            }
        }
    }
}


#pragma mark - 隐藏TabBar
- (void)hideTabBar
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.myTabBar.x = -self.myTabBar.width;
    }];
}

#pragma mark - 显示TabBar
- (void)revealTabBar
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.myTabBar.x = 0;
    }];
    
}



#pragma mark - 内存警告时调用
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
