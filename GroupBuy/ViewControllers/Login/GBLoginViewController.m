//
//  GBLoginViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-3-25.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#define kLogin_url @"http://www.tuanyifa.com/login_ios.php"

#import "GBLoginViewController.h"
#import "GBAppDelegate.h"
#import "gbRegisterViewController.h"
@interface GBLoginViewController ()<UITextFieldDelegate>
{
    IBOutlet UITextField *accountField;
    IBOutlet UITextField *passwordField;
}

- (IBAction)loginButtonClicked:(id)sender;

-(IBAction)registerButtonClicked:(id)sender;

@end

@implementation GBLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"登录";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view from its nib.
}


- (void)setupLeftBarButtonItem
{
    //do nothing
}

#pragma mark - 隐藏键盘

- (void)hideKeyboard
{
    [accountField resignFirstResponder];
    [passwordField resignFirstResponder];
}

#pragma mark -IBAction method

- (IBAction)loginButtonClicked:(id)sender
{
    [self login];
}

-(IBAction)registerButtonClicked:(id)sender
{
    [self registerAccount];
}


#pragma mark - 登录
- (void)login
{
    if ([self checkInput])
    {
        NSDictionary *params = @{@"username":accountField.text,@"userpwd":passwordField.text};
        DLog(@"params = %@",params);
        [NBNetworkEngine  loadDataWithURL:kLogin_url params:params completeHander:^(id jsonObject, BOOL success) {
            DLog(@"json obj = %@",jsonObject);
            
        }];
        return;
        GBAppDelegate *app = [[UIApplication sharedApplication] delegate];
        app.mainVC = [[GBMainViewController alloc] init];
        app.mainVC.tabBar.hidden = YES;
        app.window.rootViewController = app.mainVC;
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:DID_LOGIN];
    }
}

#pragma mark 注册

- (void)registerAccount
{
    GBRegisterViewController *registerVC = [[GBRegisterViewController alloc] initWithNibName:@"GBRegisterViewController" bundle:nil];
    [self.navigationController pushViewController:registerVC animated:YES];
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
    return YES;
}

#pragma mark - UITextField Delegate method

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == accountField)
    {
        [passwordField becomeFirstResponder];
    }
    else
    {
        [self login];
    }
    return YES;
}

#pragma mark - 内存管理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
