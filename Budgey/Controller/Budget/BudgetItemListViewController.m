//
// Created by jeremysaenz on 6/21/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <CoreGraphics/CoreGraphics.h>
#import "BudgetItemListViewController.h"
#import "BGShadowUtil.h"
#import "BGColorUtil.h"
#import "BGNotificationNames.h"
#import "TransactionViewController.h"


@implementation BudgetItemListViewController
@synthesize currentCell, currentFooterView, currentHeaderView;

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad
{
    [self.navigationItem setTitle:@"Details"];

    // setup the add button at the top right
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    [self.navigationItem setRightBarButtonItem:addButton];

    // set a clear color for the background since we
    // want a consistent background throughout the app
    self.tableView.backgroundColor = [UIColor clearColor];

    [BGShadowUtil applyShadowToView:self.tableView.layer];
    self.tableView.clipsToBounds = NO;
}

//---------------------------------------------------
//  Data Source Methods
//---------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UINib *nib = [UINib nibWithNibName:@"BudgetItemTableCell" bundle:nil];
    [nib instantiateWithOwner:self options:nil];

    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [BGColorUtil colorWithHexString:@"dfdfdf"];
    currentCell.backgroundView = backView;

    //[[cell textLabel] setText:[category objectForKey:@"name"]];

    return currentCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 58;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Hello World";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *transactionData = [[NSDictionary alloc] initWithObjectsAndKeys:
            @"Some Expense",@"name",
            @"50.00", @"amount",
            @"Entertainment",@"category",
            [[NSDate alloc] init], @"date",
            nil];

    UIViewController *transactionController = [[TransactionViewController alloc] initWithData:transactionData];
    [(UINavigationController *)self.parentViewController pushViewController:transactionController animated:YES];

    // position the view controller properly and add a shadow
    [BGShadowUtil applyShadowToView:transactionController.view.layer];
    transactionController.view.clipsToBounds = NO;
}

//---------------------------------------------------
//  Header and Footer
//---------------------------------------------------
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UINib *nib = [UINib nibWithNibName:@"BudgetItemHeaderView" bundle:nil];
    [nib instantiateWithOwner:self options:nil];
    return currentHeaderView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UINib *nib = [UINib nibWithNibName:@"BudgetItemFooterView" bundle:nil];
    [nib instantiateWithOwner:self options:nil];
    return currentFooterView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 195;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 24;
}

//---------------------------------------------------
//  UITableViewCell Logic
//---------------------------------------------------

@end