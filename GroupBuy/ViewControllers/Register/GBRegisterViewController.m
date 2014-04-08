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
    IBOutlet UITextField *repeatField;
    
}

-(IBAction)registerButtonClicked:(id)sender;

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
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tap];
}

#pragma mark -IBAction method
-(IBAction)registerButtonClicked:(id)sender
{
    [self registerAccount];
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
    if (accountField.text.length == 0)
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
    
    if (![repeatField.text isEqualToString:passwordField.text])
    {
        
        NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleError title:@"提示" message:@"两次输入的密码不一致"];
        [alert show];
        return NO;
    }
   
    return YES;
}

#pragma mark - UITextField Delegate method

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == accountField)
    {
        [passwordField becomeFirstResponder];
    }
    else if (textField == passwordField)
    {
        [repeatField becomeFirstResponder];
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
