//
//  GBOrderDetailViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-3-25.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBOrderDetailViewController.h"
#import "GBScanViewController.h"
@interface GBOrderDetailViewController ()

- (IBAction)scanButtonClicked:(id)sender;

@end

@implementation GBOrderDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"详细订单";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)scanButtonClicked:(id)sender
{
    GBScanViewController *scanVC = [[GBScanViewController alloc] initWithNibName:@"GBScanViewController" bundle:nil];
    [self.navigationController pushViewController:scanVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
