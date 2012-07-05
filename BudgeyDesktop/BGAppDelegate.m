//
//  BGAppDelegate.m
//  BudgeyDesktop
//
//  Created by Jeremy Saenz on 7/5/12.
//  Copyright (c) 2012 Leedo Studios. All rights reserved.
//

#import "BGAppDelegate.h"
#import "BGUIAppDelegate.h"

@implementation BGAppDelegate{
    BGUIAppDelegate *chameleonApp;
}

@synthesize window;
@synthesize kitView;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    chameleonApp = [[BGUIAppDelegate alloc] init];
    [kitView launchApplicationWithDelegate:chameleonApp afterDelay:1];
}

@end
