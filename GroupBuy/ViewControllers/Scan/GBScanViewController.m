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
    IBOutlet UIView *bottomView;
}

@property (retain , nonatomic) IBOutlet  ZBarReaderView *readerView;

@end

@implementation GBScanViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"扫描二维码";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [ZBarReaderView class];
    
   // bottomView.layer.frame = bottomView.frame;
    //[_readerView.layer addSublayer:bottomView.layer];
    
    _readerView.readerDelegate = self;
    [self.readerView start];
   
      // Do any additional setup after loading the view from its nib.
}


- (void) readerView: (ZBarReaderView*) readerView
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
