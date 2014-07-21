//
//  GBPayOrderViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-21.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBPayOrderViewController.h"
#import "GBOrderTicketViewController.h"
@interface GBPayOrderViewController ()
@property (weak , nonatomic) IBOutlet UIView *bgView;
@property (weak , nonatomic) IBOutlet UIButton *submitButton;
@property (weak , nonatomic) IBOutlet UILabel *countLabel;
@property (weak , nonatomic) IBOutlet UILabel *priceLabel;
@end

@implementation GBPayOrderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"支付订单";
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
    for (NSInteger i = 100;i<104;i++)
    {
        UIView *line = [_bgView viewWithTag:i];
        line.height = 0.5;
        line.backgroundColor = C2;
    }
    [self.submitButton setupBorder:CLEAR_COLOR cornerRadius:18];
}

#pragma mark - IBAction method
- (IBAction)payBtnClicked:(id)sender
{
    GBOrderTicketViewController *vc = [[GBOrderTicketViewController alloc] initWithNibName:@"GBOrderTicketViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}



#pragma mark - 内存警告

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
