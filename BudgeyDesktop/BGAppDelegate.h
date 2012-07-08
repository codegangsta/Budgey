//
//  BGAppDelegate.h
//  BudgeyDesktop
//
//  Created by Jeremy Saenz on 7/5/12.
//  Copyright (c) 2012 Leedo Studios. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <UIKit/UIKitView.h>
#import "EDSideBar.h"

@class INAppStoreWindow;

@interface BGAppDelegate : NSObject <NSApplicationDelegate, NSWindowDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet EDSideBar *sideBar;
@property (assign) IBOutlet UIKitView *kitView;

-(void)resizeKitView;

@end
