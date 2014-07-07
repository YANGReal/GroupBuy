//
//  GBScanViewController.m
//  GroupBuy
//
//  Created by YANGReal on 14-3-25.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBScanViewController.h"
#import "ZBarSDK.h"
@interface GBScanViewController ()<ZBarReaderViewDelegate>
{
   
}

@property (retain , nonatomic) IBOutlet  ZBarReaderView *readerView;

@property (weak , nonatomic) IBOutlet UIImageView *backView;
@property (weak , nonatomic) IBOutlet UIButton *backBtn;
@property (weak , nonatomic) IBOutlet UIImageView *frameView;
@property (weak , nonatomic) IBOutlet UILabel *descLabel;
@property (weak , nonatomic) IBOutlet UIImageView *greenLine;

- (IBAction)backBtnClicked:(id)sender;
@end

@implementation GBScanViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       // self.title = @"扫描二维码";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews
{
    [self hideBanner];
    [ZBarReaderView class];
    _readerView.readerDelegate = self;
    [self.readerView start];
    self.frameView.center = self.view.center;
    [_readerView.layer addSublayer:_backView.layer];
    [_readerView.layer addSublayer:_backBtn.layer];
    [_readerView.layer addSublayer:_frameView.layer];
    [_readerView.layer addSublayer:_descLabel.layer];
    [_readerView.layer addSublayer:_greenLine.layer];
    
    [UIView animateWithDuration:1.0 animations:^{
        self.greenLine.y =  _frameView.y+_frameView.height-28;
    } completion:^(BOOL finished) {
        [self animate];
    }];

}


- (void)animate
{
    [UIView animateWithDuration:1.0 animations:^{
        // self.line.frame = RECT(2, 20, 258, 1);
        self.greenLine.y = _frameView.y+20;
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1.0 animations:^{
           
            self.greenLine.y = _frameView.y+_frameView.height-28;
        } completion:^(BOOL finished) {
            [self animate];
        }];
    }];
}




- (IBAction)backBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - ZBarReaderViewDelegate method
- (void)readerView: (ZBarReaderView*) readerView
     didReadSymbols: (ZBarSymbolSet*) symbols
          fromImage: (UIImage*) image;
{
    for(ZBarSymbol *sym in symbols)
    {
        [_readerView stop];
        [AppUtility showAlertWithMessage:sym.data];
        break;
    }

}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_readerView stop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
