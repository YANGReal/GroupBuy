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
    [self setupLeftBarButtonItem];
	// Do any additional setup after loading the view.
}


- (void)setupLeftBarButtonItem
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = RECT(0, 0, 40, 40);
    //[btn setTitle:@"返回" forState:UIControlStateNormal];
//    [btn setBackgroundImage:[UIImage imageFromMainBundleFile:@"back.png"] forState:UIControlStateNormal];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:RECT(0, 12, 9, 15)];
    [imageView setImage:[UIImage imageFromMainBundleFile:@"back.png"]];

    [btn addSubview:imageView];
    
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
