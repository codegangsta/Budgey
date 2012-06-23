//
//  AppDelegate.h
//  Budgey
//
//  Created by Jeremy Saenz on 06/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UIViewController *mainViewController;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *currentTransactionView;

// put any UIAppearance changes here
-(void)skinControls;

@end