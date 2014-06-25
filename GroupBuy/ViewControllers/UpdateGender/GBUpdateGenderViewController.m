//
//  GBUpdateGenderViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-6-24.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBUpdateGenderViewController.h"

@interface GBUpdateGenderViewController ()
@property (weak , nonatomic) IBOutlet UIView *bgView;
@property (weak , nonatomic) IBOutlet UIView *line;
@property (weak , nonatomic) IBOutlet UIButton *maleBtn,*femaleBtn;

- (IBAction)btnClicked:(id)sender;

@end

@implementation GBUpdateGenderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"修改性别";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     [self hideBanner];
    [self setupViews];
    // Do any additional setup after loading the view from its nib.
}

- (void)setupViews
{
    [self.bgView setupBorder:C2 cornerRadius:0];
    self.line.height = 0.5;
    self.line.backgroundColor = C2;
    self.maleBtn.selected = YES;
}

- (IBAction)btnClicked:(id)sender
{
    if (sender == _maleBtn)
    {
        _maleBtn.selected = YES;
        _femaleBtn.selected = NO;
    }
    else
    {
        _maleBtn.selected = NO;
        _femaleBtn.selected = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
