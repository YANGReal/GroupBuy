//
//  GBSearchViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-7.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBSearchViewController.h"

@interface GBSearchViewController ()<UITextFieldDelegate>

@property (weak , nonatomic) IBOutlet UIView *searchView;
@property (weak , nonatomic) IBOutlet UIView *textField;
@end

@implementation GBSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"搜索";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
    // Do any additional setup after loading the view from its nib.
}

- (void)setupViews
{
    [self hideBanner];
    [self.navigationController setNavigationBarHidden:NO];
    self.searchView.backgroundColor = WHITE_COLOR;
    [self.searchView setupBorder:WHITE_COLOR cornerRadius:18];
    [self loadTags];
    
}


- (void)loadTags
{
    for (NSInteger i = 0;i<6;i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = RECT(16+(i%3)*102, (i/3)*45+135, 87, 36);
        button.tag = i;
        [button setTitle:@"万达影城" forState:UIControlStateNormal];
        [button setTitleColor:C3 forState:UIControlStateNormal];
        button.titleLabel.font = F3;
        
        [button setBackgroundImage:[UIImage imageWithColor:WHITE_COLOR] forState:UIControlStateNormal];
        [self.view addSubview:button];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_textField resignFirstResponder];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - 内存管理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
