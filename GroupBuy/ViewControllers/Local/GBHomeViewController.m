//
//  GBLocalViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-3-20.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBHomeViewController.h"
#import "GBOrderViewController.h"
@interface GBHomeViewController ()

- (IBAction)btnClicked:(id)sender;

@end

@implementation GBHomeViewController

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
}


//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
//}


- (IBAction)btnClicked:(id)sender
{
   
  
    GBOrderViewController *vc = [[GBOrderViewController alloc] initWithNibName:@"GBOrderViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)setupLeftBarButtonItem
{
    //Do nothing
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
