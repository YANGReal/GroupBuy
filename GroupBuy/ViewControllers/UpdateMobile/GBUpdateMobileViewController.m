//
//  GBUpdateMobileViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-6-24.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBUpdateMobileViewController.h"

@interface GBUpdateMobileViewController ()
@property (weak , nonatomic) IBOutlet UIView *bgView;
@property (weak , nonatomic) IBOutlet UIView *line1,*line2;
@property (weak , nonatomic) IBOutlet UIButton *button;
@property (weak , nonatomic) IBOutlet UITextField *oldMobileField;
@property (weak , nonatomic) IBOutlet UITextField *newlyMobileField;
@property (weak , nonatomic) IBOutlet UITextField *codeField;
@end

@implementation GBUpdateMobileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"修改手机号码";
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
    self.line1.height = self.line2.height = 0.5;
    self.line1.backgroundColor = self.line2.backgroundColor = C2;
    [self.button setupBorder:CLEAR_COLOR cornerRadius:19];
    [self.button setTitleColor:C1 forState:UIControlStateNormal];
    [self.button setTitleColor:C8 forState:UIControlStateHighlighted];
}

#pragma mark - 收回键盘
- (void)touchesBegan:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    [self.oldMobileField resignFirstResponder];
    [self.newlyMobileField resignFirstResponder];
    [self.codeField resignFirstResponder];
}

#pragma mark - 内存管理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
