//
//  NBNavigationController.m
//  iCareer
//
//  Created by YANGRui on 14-3-12.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBNavigationController.h"

@interface NBNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation NBNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    __weak NBNavigationController *nav = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.delegate = nav;
        self.delegate = nav;
    }
    
    
	// Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
   //暂时禁用手势
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = NO;
       
    }
     [super pushViewController:viewController animated:animated];

}



#pragma mark - UINavigationController delegate method
- (void)navigationController:(UINavigationController *)navigationController
        didShowViewController:(UIViewController *)viewController
                     animated:(BOOL)animate
{
    //恢复使用手势
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
