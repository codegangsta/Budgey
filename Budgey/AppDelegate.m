//
//  AppDelegate.m
//  Budgey
//
//  Created by Jeremy Saenz on 06/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "BudgetListViewController.h"
#import "BGTabBarController.h"

@implementation AppDelegate

@synthesize window = _window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // set the background image
    self.window.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.jpg"]];

    // root view controller
    BGTabBarController *tabBarController = [[BGTabBarController alloc] init];
    [self.window setRootViewController:tabBarController];

    // create the budget list
    BudgetListViewController *budgetListViewController = [[BudgetListViewController alloc] init];
    [budgetListViewController setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Budget" image:nil tag:0]];
    [tabBarController addChildViewController:budgetListViewController];

    // create the savings list
    [tabBarController addChildViewController:[tabBarController viewControllerWithTabTitle:@"Savings" image:nil]];

    // center button
    [tabBarController addChildViewController:[tabBarController viewControllerWithTabTitle:@"" image:nil]];

    // create the debts list
    [tabBarController addChildViewController:[tabBarController viewControllerWithTabTitle:@"Debt" image:nil]];

    // create the settings
    [tabBarController addChildViewController:[tabBarController viewControllerWithTabTitle:@"Settings" image:nil]];

    [tabBarController addCenterButtonWithImage:[UIImage imageNamed:@"capture-button.png"] highlightImage:nil];

    [self.window makeKeyAndVisible];

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