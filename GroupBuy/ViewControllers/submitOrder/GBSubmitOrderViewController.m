//
//  GBSubmitOrderViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-21.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBSubmitOrderViewController.h"
#import "GBPayOrderViewController.h"
@interface GBSubmitOrderViewController ()

@property (weak , nonatomic) IBOutlet UIView *bgView;
@property (weak , nonatomic) IBOutlet UIButton *submitButton;
@property (weak , nonatomic) IBOutlet UILabel *countLabel;
@property (weak , nonatomic) IBOutlet UILabel *priceLabel;
@property (assign , nonatomic) NSInteger count;
- (IBAction)submitBtnClicked:(id)sender;

- (IBAction)addBtnClicked:(id)sender;

- (IBAction)minusBtnClicked:(id)sender;

@end

@implementation GBSubmitOrderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.count = 1;
        self.title  = @"提交订单";
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
    for (NSInteger i = 100;i<103;i++)
    {
        UIView *line = [_bgView viewWithTag:i];
        line.height = 0.5;
        line.backgroundColor = C2;
    }
    [self.submitButton setupBorder:CLEAR_COLOR cornerRadius:18];
}

#pragma mark - IBAction method
- (IBAction)submitBtnClicked:(id)sender
{
    GBPayOrderViewController *vc = [[GBPayOrderViewController alloc] initWithNibName:@"GBPayOrderViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)addBtnClicked:(id)sender
{
    self.count++;
    self.countLabel.text = [NSString stringWithFormat:@"%d",_count];
    float total = self.count*self.price;
    self.priceLabel.text = [NSString stringWithFormat:@"%0.2f",total];
}

- (IBAction)minusBtnClicked:(id)sender
{
    if (self.count== 1)
    {
        return;
    }
    self.count -- ;
    self.countLabel.text = [NSString stringWithFormat:@"%d",_count];
    float total = self.count*self.price;
    self.priceLabel.text = [NSString stringWithFormat:@"%0.2f",total];

}


#pragma mark - 内存警告

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
