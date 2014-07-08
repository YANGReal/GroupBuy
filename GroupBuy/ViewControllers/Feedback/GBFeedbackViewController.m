//
//  GBFeedbackViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-7-8.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBFeedbackViewController.h"

@interface GBFeedbackViewController ()<UITextViewDelegate>
@property (weak , nonatomic) IBOutlet UITextView *textView;
@property (weak , nonatomic) IBOutlet UIButton *submitButton;
@property (weak , nonatomic) IBOutlet UILabel *placeHolderLabel;
@end

@implementation GBFeedbackViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"意见反馈";
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
    self.textView.backgroundColor = WHITE_COLOR;
    [self.submitButton setupBorder:CLEAR_COLOR cornerRadius:15];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_textView resignFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    _placeHolderLabel.hidden = YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    
    if (textView.text.length == 0)
    {
        _placeHolderLabel.hidden = NO;
    }
}


@end
