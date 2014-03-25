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

@end

@implementation GBMainViewController

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
    [self setupTabBar];
    [self setupViewControllers];
    // Do any additional setup after loading the view.
}


#pragma mark - 自定义UITabBar
/*自定义UITabBar*/
- (void)setupTabBar
{
    CGFloat iconSpace = 30;
    CGRect rect = [[UIScreen mainScreen] bounds];
    self.myTabBar = [[UIView alloc] initWithFrame:RECT(0, DEVICE_HEIGHT-49, DEVICE_WIDTH, 49)];
    self.myTabBar.backgroundColor = WHITE_COLOR;
    [self.view addSubview:self.myTabBar];
    
    NSArray *iconArr1 = @[@"local.png",@"ticket.png",@"merchant.png",@"profile.png",@"more.png"];
    NSArray *iconArr2 = @[@"local_s.png",@"ticket_s.png",@"merchant_s.png",@"profile_s.png",@"more_s.png"];
    CGFloat btnWidth = rect.size.width/5.0;
    for (int i = 0;i<5;i++)
    {
        UIImageView *iconView = [[UIImageView alloc] initWithFrame:RECT(15+33*i+iconSpace*i, 5, 45,33)];
        iconView.tag = 100 + i;
        iconView.image = [UIImage imageFromMainBundleFile:iconArr1[i]];
        iconView.highlightedImage = [UIImage imageFromMainBundleFile:iconArr2[i]];
        if (i == 0)
        {
            iconView.highlighted = YES;
        }
        [self.myTabBar addSubview:iconView];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i + 100;
        button.frame = RECT(i*btnWidth, 0, rect.size.width/4.0, 49);
        [button addTarget:self action:@selector(tabBarTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.myTabBar addSubview:button];
        UIImageView *verticalLine = [[UIImageView alloc] initWithFrame:RECT(68+33*i+iconSpace*i, 0, 1, 49)];
        verticalLine.image = [UIImage imageFromMainBundleFile:@"v_line.png"];
        //verticalLine.backgroundColor = RED_COLOR;
        [self.myTabBar addSubview:verticalLine];
    }
    UIView *line = [[UIView alloc] initWithFrame:RECT(0, 0, DEVICE_WIDTH, 1)];
    line.backgroundColor = LIGHT_GRAY;
    [self.myTabBar addSubview:line];
    self.view.backgroundColor = BG_COLOR;
}

#pragma mark - 设置UITabBarController的子视图控制器

- (void)setupViewControllers
{
    GBLocalViewController *localVC = [[GBLocalViewController alloc] initWithNibName:@"GBLocalViewController" bundle:nil];
    NBNavigationController *nav1 = [[NBNavigationController alloc] initWithRootViewController:localVC];
    
    GBTicketViewController *ticketVC = [[GBTicketViewController alloc] initWithNibName:@"GBTicketViewController" bundle:nil];
    NBNavigationController *nav2 = [[NBNavigationController alloc] initWithRootViewController:ticketVC];
    
    GBMerchantViewController *merchantVC = [[GBMerchantViewController alloc] initWithNibName:@"GBMerchantViewController" bundle:nil];
    NBNavigationController *nav3 = [[NBNavigationController alloc] initWithRootViewController:merchantVC];
    
    GBProfileViewController *profileVC = [[GBProfileViewController alloc] initWithNibName:@"GBProfileViewController" bundle:nil];
    NBNavigationController *nav4 = [[NBNavigationController alloc] initWithRootViewController:profileVC];
    
    GBMoreViewController *moreVC = [[GBMoreViewController alloc] initWithNibName:@"GBMoreViewController" bundle:nil];
    NBNavigationController *nav5 = [[NBNavigationController alloc] initWithRootViewController:moreVC];
    
    self.viewControllers = @[nav1,nav2,nav3,nav4,nav5];
}


#pragma mark - 点击tabBar时候调用
- (void)tabBarTapped:(UIButton *)sender
{
    self.selectedIndex = sender.tag - 100;
    
    for (UIView *view in self.myTabBar.subviews)
    {
        if ([view isKindOfClass:[UIImageView class]])
        {
            UIImageView *icon = (UIImageView *)view;
           
            if (icon.tag == sender.tag)
            {
                icon.highlighted = YES;
                 NSLog(@"icon.tag = %d",icon.tag);
            }
            else
            {
                icon.highlighted = NO;
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
