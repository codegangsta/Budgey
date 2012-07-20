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
    UIViewController *currentCreateBudgetItemView;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *currentTransactionView;
@property (strong, nonatomic) UIViewController *currentCreateBudgetView;

// put any UIAppearance changes here
-(void)skinControls;

@end