//
// Created by jeremysaenz on 6/14/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BGTabBarController.h"
#import "BudgetListViewController.h"


@implementation BGTabBarController


- (id)init
{
    self = [super init];

    // create the budget list
    BudgetListViewController *budgetListViewController = [[BudgetListViewController alloc] init];
    [budgetListViewController setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Budget" image:[UIImage imageNamed:@"162-receipt.png"] tag:0]];
    [self addChildViewController:budgetListViewController];

    // create the savings list
    [self addChildViewController:[self viewControllerWithTabTitle:@"Savings" image:[UIImage imageNamed:@"119-piggy-bank.png"]]];

    // center button
    UIViewController *quickAdd = [self viewControllerWithTabTitle:@"" image:nil];
    [quickAdd.tabBarItem setEnabled:NO];
    [self addChildViewController:quickAdd];

    // create the debts list
    [self addChildViewController:[self viewControllerWithTabTitle:@"Debt" image:[UIImage imageNamed:@"172-pricetag.png"]]];

    // create the settings
    UIViewController *moreController = [[UIViewController alloc] init];
    [moreController setTabBarItem:[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:0]];
    [self addChildViewController:moreController];


    [self addCenterButtonWithImage:[UIImage imageNamed:@"capture-button.png"] highlightImage:nil];

    return self;
}

// Create a custom UIButton and add it to the center of our tab bar
-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];

    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
        button.center = self.tabBar.center;
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        button.center = center;
    }

    [self.view addSubview:button];
}

// Create a view controller and setup it's tab bar item with a title and image
-(UIViewController*) viewControllerWithTabTitle:(NSString*) title image:(UIImage*)image
{
    UIViewController* viewController = [[UIViewController alloc] init];
    viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image tag:0];
    return viewController;
}

@end