//
//  NBBaseViewController.m
//  iCareer
//
//  Created by YANGRui on 14-2-27.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBBaseViewController.h"

@interface NBBaseViewController () <MBProgressHUDDelegate>
@property (strong , nonatomic) UIImageView *navBanner;
@end

@implementation NBBaseViewController

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
    self.view.frame = IP5ORIP4FRAME;

    self.view.backgroundColor = BG_COLOR;

    [self setupLeftBarButtonItem];
    [self setupTopViews];
	// Do any additional setup after loading the view.
}


- (void)setupTopViews
{
    self.navBanner = [[UIImageView alloc] initWithFrame:RECT(0, 0, self.view.width, 84)];
    self.navBanner.image = [UIImage imageFromMainBundleFile:@"nav.png"];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:RECT(100, 30, 120, 24)];
    titleLabel.font = F5;
    titleLabel.textColor = C1;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = self.title;
    [self.view addSubview:self.navBanner];
     [self.view addSubview:titleLabel];
}

- (void)setupLeftBarButtonItem
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];

    btn.frame = RECT(0, 0, 12, 20);
    [btn setBackgroundImage:[UIImage imageFromMainBundleFile:@"back.png"] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

- (void)hideBanner
{
    self.navBanner.hidden = YES;
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showMBLoding
{
    UIView *view = nil;
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window == nil)
    {
        view = self.navigationController.view;
    }
    else
    {
        view = window;
    }
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.margin = 20;
    hud.tag = -10001;
    hud.delegate = self;
    
    //    hud.dimBackground = YES;
    //    hud.color = DEEP_GREEN;
    hud.mode = MBProgressHUDModeIndeterminate;
    
    // UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [view addSubview:hud];
    [hud show:YES];
}

- (void)hideMBLoding
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIView *view = self.navigationController.view;
    MBProgressHUD *hud = (MBProgressHUD *)[window viewWithTag:-10001];
    if (hud == nil)
    {
        hud = (MBProgressHUD *)[view viewWithTag:-10001];
    }
    [hud hide:YES];
    
}

- (void)showMBLodingWithMessage:(NSString *)msg
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:window];
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.tag = -10001;
    hud.delegate = self;
    //hud.darkBlur = YES;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = msg;
    [window addSubview:hud];
    [hud show:YES];
    [hud hide:YES afterDelay:2.0];
}

#pragma mark -MBProgressHUDDelegate method

- (void)hudWasHidden:(MBProgressHUD *)hud
{
    [hud removeFromSuperview];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
