//
//  NBBaseViewController.m
//  iCareer
//
//  Created by YANGRui on 14-2-27.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBBaseViewController.h"

@interface NBBaseViewController ()

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
    UIImageView *navBar = [[UIImageView alloc] initWithFrame:RECT(0, 0, self.view.width, 84)];
    navBar.image = [UIImage imageFromMainBundleFile:@"nav.png"];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:RECT(100, 30, 120, 24)];
    titleLabel.font = F5;
    titleLabel.textColor = C1;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = self.title;
    [self.view addSubview:navBar];
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


- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
