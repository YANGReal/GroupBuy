//
//  GBAppDelegate.m
//  GroupBuy
//
//  Created by YANGRui on 14-3-20.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "GBAppDelegate.h"
<<<<<<< HEAD

=======
#import "GBLoginViewController.h"
>>>>>>> FETCH_HEAD
@implementation GBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
<<<<<<< HEAD
=======

//    self.mainVC = [[GBMainViewController alloc] init];
//    self.mainVC.tabBar.hidden = YES;
//    self.window.rootViewController = self.mainVC;
    
    BOOL didLogin = [[NSUserDefaults standardUserDefaults] boolForKey:DID_LOGIN];
    if (didLogin)
    {
        self.mainVC = [[GBMainViewController alloc] init];
        self.mainVC.tabBar.hidden = YES;
        self.window.rootViewController = self.mainVC;
    }
    else
    {
        GBLoginViewController *loginVC = [[GBLoginViewController alloc] initWithNibName:@"GBLoginViewController" bundle:nil];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
        self.window.rootViewController = nav;
    }
    
    /*设置导航栏背景颜色*/
    [[UINavigationBar appearance] setBarTintColor:GREEN];
    /*设置导航栏字体颜色和字体*/
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];
>>>>>>> FETCH_HEAD
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
