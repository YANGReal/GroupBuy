//
//  GBRegisterViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-3-25.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//




#import "GBRegisterViewController.h"

@interface GBRegisterViewController ()<UITextFieldDelegate>
{
    IBOutlet UITextField *accountField;
    IBOutlet UITextField *passwordField;
    IBOutlet UITextField *mailField;
    
    IBOutlet UIView *line1,*line2;
    IBOutlet UIButton *loginBtn;
    IBOutlet UIButton *checkBtn;
    BOOL checked;
    
}

- (IBAction)registerButtonClicked:(id)sender;

- (IBAction)checkBtnClicked:(id)sender;

@end

@implementation GBRegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"注册";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupViews];
}


- (void)setupViews
{
    line1.backgroundColor =line2.backgroundColor = LIGHT_GRAY;
    line1.height = line2.height = 0.5;
    [loginBtn setupBorder:CLEAR_COLOR cornerRadius:19];
    [loginBtn setTitleColor:C1 forState:UIControlStateNormal];
    [loginBtn setTitleColor:C8 forState:UIControlStateHighlighted];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tap];

}


#pragma mark -IBAction method
-(IBAction)registerButtonClicked:(id)sender
{
    [self registerAccount];
}

- (IBAction)checkBtnClicked:(id)sender
{
    if (!checked)
    {
        checkBtn.selected = YES;
    }
    else
    {
        checkBtn.selected = NO;
    }
    checked = !checked;
}

#pragma mark 注册

- (void)registerAccount
{
    if ([self checkInput])
    {
        [self doRigster];
    }
}

#pragma mark - 注册回调方法
- (void)doRigster
{
    return;
    /*
    NSDictionary *params = @{@"username": accountField.text,@"userpwd":passwordField.text};
    DLog(@"params = %@",params);
    [NBNetworkEngine loadDataWithURL:kRegister_url params:params completeHander:^(id jsonObject, BOOL success) {
        DLog(@"%@",jsonObject);
    }];
     */
}


#pragma mark -检查输入
- (BOOL)checkInput
{
    if (mailField.text.length == 0)
    {
        NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleError title:@"提示" message:@"请输入邮箱"];
        [alert show];
        return NO;
    }
    
    if(accountField.text.length == 0)
    {
        NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleError title:@"提示" message:@"请输入用户名"];
        [alert show];
        return NO;
    }
    
    if (passwordField.text.length == 0)
    {
        NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleError title:@"提示" message:@"请输入密码"];
        [alert show];
        return NO;
    }
    
    
    return YES;
}

#pragma mark - UITextField Delegate method

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == mailField)
    {
        [accountField becomeFirstResponder];
    }
    else if (textField == accountField)
    {
        [passwordField becomeFirstResponder];
    }
    else
    {
        [self registerAccount];
        [textField resignFirstResponder];
    }
    return YES;
}


#pragma mark - 隐藏键盘

- (void)hideKeyboard
{
    [accountField resignFirstResponder];
    [passwordField resignFirstResponder];
}

#pragma mark - 内存管理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
