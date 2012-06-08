//
//  MainViewController.m
//  Budgey
//
//  Created by Jeremy Saenz on 06/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "BudgetListViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)init
{
    self = [self initWithNibName:@"MainViewController" bundle:nil];
    return self;
}

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

    // add the budget category table
    UITableViewController *categoryController = [[BudgetListViewController alloc] init];
    //[self addChildViewController:categoryController];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
