//
// Created by jeremysaenz on 6/21/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BudgetItemListViewController.h"
#import "BGShadowUtil.h"
#import "BGColorUtil.h"
#import "TransactionViewController.h"
#import "BGBudgetItem.h"
#import "BGTransaction.h"
#import "BudgetItemTableCell.h"
#import "BudgetItemHeaderView.h"
#import "BGTransactionManager.h"


@implementation BudgetItemListViewController
{
    NSArray *transactions;
}
@synthesize currentCell, currentFooterView, currentHeaderView, budgetItem;

//---------------------------------------------------
//  Initialization
//---------------------------------------------------
- (id)initWithBudgetItem:(BGBudgetItem *)aBudgetItem
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    [self setBudgetItem:aBudgetItem];
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

    // add observers
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onTransactionCreated:) name:BGTransactionWasCreated object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onTransactionDeleted:) name:BGTransactionWasDeleted object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onTransactionUpdated:) name:BGTransactionWasUpdated object:nil];
}

- (void)viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//---------------------------------------------------
//  Budget Item
//---------------------------------------------------
- (void)setBudgetItem:(BGBudgetItem *)aBudgetItem
{
    budgetItem = aBudgetItem;
    [self refresh];
    [self.tableView reloadData];
}

- (void)refresh
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
    transactions = [[budgetItem transactions] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}

//---------------------------------------------------
//  Actions
//---------------------------------------------------
- (void)onTransactionCreated:(NSNotification *)notification
{
    // refresh the datasource
    [self refresh];

    BGTransaction *transaction = [notification object];

    if (transaction && [transactions containsObject:transaction]) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:[transactions indexOfObject:transaction] inSection:0];
        [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationAutomatic];
    }

    [currentHeaderView setBudgetItem:budgetItem];
}

- (void)onTransactionDeleted:(NSNotification *)notification
{
    BGTransaction *budget = [notification object];
    NSIndexPath *path = [NSIndexPath indexPathForRow:[transactions indexOfObject:budget] inSection:0];

    // refresh the datasource
    [self refresh];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationAutomatic];

    [currentHeaderView setBudgetItem:budgetItem];
}

- (void)onTransactionUpdated:(NSNotification *)notification
{
    [self refresh];
    [self.tableView reloadData];
}

//---------------------------------------------------
//  Data Source Methods
//---------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UINib *nib = [UINib nibWithNibName:@"BudgetItemTableCell" bundle:nil];
    [nib instantiateWithOwner:self options:nil];

    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [BGColorUtil colorWithHexString:@"d4d4d4"];
    currentCell.backgroundView = backView;

    [currentCell setTransaction:[transactions objectAtIndex:[indexPath row]]];

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
    return @"";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return transactions.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *transactionController = [[TransactionViewController alloc] initWithData:[transactions objectAtIndex:[indexPath row]]];
    [(UINavigationController *) self.parentViewController pushViewController:transactionController animated:YES];

    // position the view controller properly and add a shadow
    [BGShadowUtil applyShadowToView:transactionController.view.layer];
    transactionController.view.clipsToBounds = NO;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        BGTransaction *transaction = [transactions objectAtIndex:[indexPath row]];
        if (transaction) {
            [[BGTransactionManager sharedManager] deleteTransaction:transaction];
        }
    }
}

//---------------------------------------------------
//  Header and Footer
//---------------------------------------------------
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UINib *nib = [UINib nibWithNibName:@"BudgetItemHeaderView" bundle:nil];
    [nib instantiateWithOwner:self options:nil];
    [currentHeaderView setBudgetItem:budgetItem];
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
    return 189;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 24;
}

@end