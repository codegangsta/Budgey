//
//  AppDelegate.m
//  Budgey
//
//  Created by Jeremy Saenz on 06/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "BGTabBarController.h"
#import "TransactionViewController.h"
#import "PPRevealSideViewController.h"
#import "BudgetMonthTableViewController.h"
#import "CreateBudgetViewController.h"
#import "CreateBudgetItemViewController.h"

@implementation AppDelegate

@synthesize window = _window, currentTransactionView;
@synthesize currentCreateBudgetView = _currentCreateBudgetView;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // initialize MagicRecord
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"Budgey.sqlite"];

    [self skinControls];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // root view controller
    mainViewController = [[BGTabBarController alloc] init];
    PPRevealSideViewController *revealController = [[PPRevealSideViewController alloc] initWithRootViewController:mainViewController];
    [self.window setRootViewController:revealController];

    [self.window makeKeyAndVisible];

    // month controller
    BudgetMonthTableViewController *monthTableViewController = [[BudgetMonthTableViewController alloc] init];
    [revealController preloadViewController:monthTableViewController forSide:PPRevealSideDirectionLeft];

    // listen to notifications
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(onCenterButtonClick) name:BGCenterButtonWasClicked object:nil];
    [center addObserver:self selector:@selector(onRevealLeftView) name:BGRevealLeftView object:nil];
    [center addObserver:self selector:@selector(onCreateNewBudget) name:BGShowCreateBudgetView object:nil];
    [center addObserver:self selector:@selector(onCreateNewBudgetItem:) name:BGShowCreateBudgetItemView object:nil];

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
    [MagicalRecord cleanUp];
}

- (void)onCenterButtonClick
{
    UIViewController *transactionController = [[TransactionViewController alloc] initWithModal];
    [[mainViewController view] addSubview:[transactionController view]];
    [self setCurrentTransactionView:transactionController];
}

- (void)onCreateNewBudget
{
    UIViewController *createBudgetController = [[CreateBudgetViewController alloc] init];
    [[self.window.rootViewController view] addSubview:[createBudgetController view]];
    [self setCurrentCreateBudgetView:createBudgetController];
}

-(void)onCreateNewBudgetItem:(NSNotification *)notification
{
    CreateBudgetItemViewController *createBudgetItemController = [[CreateBudgetItemViewController alloc] init];
    [[self.window.rootViewController view] addSubview:[createBudgetItemController view]];
    [createBudgetItemController setSelectedCategory:[notification object]];
    currentCreateBudgetItemView = createBudgetItemController;
}

- (void)onRevealLeftView
{
    [(PPRevealSideViewController *) self.window.rootViewController pushOldViewControllerOnDirection:PPRevealSideDirectionLeft animated:YES];
}

- (void)skinControls
{
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tab-bar.png"]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigation-bar.png"] forBarMetrics:UIBarMetricsDefault];
}

@end