//
//  GBOrderTicketViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-21.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBOrderTicketViewController.h"

@interface GBOrderTicketViewController ()
@property (weak , nonatomic) IBOutlet UIView *bgView;
@property (weak , nonatomic) IBOutlet UIView *line1,*line2,*line3;
@property (weak , nonatomic) IBOutlet UIButton *confirmBtn;
@property (weak , nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation GBOrderTicketViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"订单券";
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
    self.bgView.clipsToBounds = YES;
    self.line1.height = self.line2.height = self.line3.height = 0.5;
    self.line1.backgroundColor = self.line2.backgroundColor = self.line3.backgroundColor = C2;
    [self.confirmBtn setupBorder:CLEAR_COLOR cornerRadius:18];
    self.scrollView.contentSize = CGSizeMake(self.view.width, self.view.height+50);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
