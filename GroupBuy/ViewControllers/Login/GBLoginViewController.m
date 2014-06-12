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
    IBOutlet UIView *bgView;
    IBOutlet UIView *line1,*line2;
    IBOutlet UIButton *loginBtn;
    
    IBOutlet UIView *qqView;
    IBOutlet UIView *renrenView;
    IBOutlet UIView *weiboView;
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
    [self setupViews];
    [self setupRightBarButtonItem];
    // Do any additional setup after loading the view from its nib.
}


- (void)setupViews
{
    [bgView setupBorder:LIGHT_GRAY cornerRadius:0];
    line1.backgroundColor =line2.backgroundColor = LIGHT_GRAY;
    line1.height = line2.height = 0.5;
    
    [loginBtn setupBorder:CLEAR_COLOR cornerRadius:19];
    [loginBtn setTitleColor:C1 forState:UIControlStateNormal];
    [loginBtn setTitleColor:C8 forState:UIControlStateHighlighted];
    
    qqView.backgroundColor = CLEAR_COLOR;
    [qqView setupBorder:[UIColor colorWithHexString:@"#3e96d6"] cornerRadius:19];
    renrenView.backgroundColor = CLEAR_COLOR;
    [renrenView setupBorder:[UIColor colorWithHexString:@"#004ea2"] cornerRadius:19];
    weiboView.backgroundColor = CLEAR_COLOR;
    [weiboView setupBorder:[UIColor colorWithHexString:@"#e6162d"] cornerRadius:19];
}


- (void)setupRightBarButtonItem
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = RECT(0, 0, 70, 40);
    [btn setTitle:@"免费注册" forState:UIControlStateNormal];
    [btn.titleLabel setFont:F5];
    [btn setTitleColor:C1 forState:UIControlStateNormal];
    [btn setTitleColor:C8 forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(registerButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
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

-(void)registerButtonClicked:(id)sender
{
    [self registerAccount];
}
- (void)setupLeftBarButtonItem
{
    //
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
