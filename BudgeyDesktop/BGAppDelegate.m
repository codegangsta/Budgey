//
//  BGAppDelegate.m
//  BudgeyDesktop
//
//  Created by Jeremy Saenz on 7/5/12.
//  Copyright (c) 2012 Leedo Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGAppDelegate.h"
#import "BGUIAppDelegate.h"
#import "INAppStoreWindow.h"
#import "BGBudgetManager.h"
#import "BGBudget.h"
#import "CategoryListViewController.h"

@implementation BGAppDelegate{
    BGUIAppDelegate *chameleonApp;
}

@synthesize window;
@synthesize kitView;
@synthesize sideBar;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // initialize magical record
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"Budgey2.sqlite"];

    // Insert code here to initialize your application
    chameleonApp = [[BGUIAppDelegate alloc] init];
    [kitView launchApplicationWithDelegate:chameleonApp afterDelay:0];
    [self resizeKitView];

    //window.titleBarHeight = 36.0;

    // some initialization code so we have some data in here
    BGBudgetManager *manager = [BGBudgetManager sharedManager];
    if(manager.findAll.count == 0) {
        BGBudget *budget = [manager createBudgetFromDefaultTemplate:@"New Budget" andDate:[[NSDate alloc] init]];
        [manager setSelectedBudget:budget];
    }
    else
    {
        [manager setSelectedBudget:[[manager findAll] objectAtIndex:0]];
    }
}

- (void)windowDidResize:(NSNotification *)notification
{
    [self resizeKitView];
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
    [MagicalRecord cleanUp];
}

- (void)awakeFromNib
{
    sideBar.backgroundColor = [NSColor blackColor];
    [self resizeKitView];
}

- (void)resizeKitView
{
    CGRect frame = chameleonApp.controller.view.frame;
    frame.size.height = ((NSView *)window.contentView).frame.size.height;
    [chameleonApp.controller.view setFrame:frame];
}


@end
