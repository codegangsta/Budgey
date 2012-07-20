//
// Created by jeremysaenz on 6/4/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CategoryListViewController.h"
#import "BGColorUtil.h"
#import "QuartzCore/CALayer.h"
#import "BGShadowUtil.h"
#import "BGBudgetManager.h"
#import "BGBudget.h"
#import "BGCategory.h"
#import "BudgetHeaderView.h"
#import "BudgetTableCell.h"
#import "BGBudgetItem.h"
#import "BudgetFooterView.h"
#import "SummaryHeaderView.h"
#import "SummaryTableCell.h"
#import "SummaryFooterView.h"

#if TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
#import "BudgetItemListViewController.h"
#import "BGBudgetItemManager.h"
#else
//Do Nothing
#endif

@implementation CategoryListViewController
{
    BGBudgetManager *budgetManager;
    BGBudgetItemManager *budgetItemManager;
    NSIndexPath *deletedIndexPath;

#if TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
BudgetItemListViewController *budgetItemListViewController;
#else
//Do Nothing
#endif

}

@synthesize currentFooterView;
@synthesize currentCell;
@synthesize currentHeaderView;
@synthesize summaryHeaderView;
@synthesize summaryFooterView;
@synthesize summaryCell;


- (id)init
{
    // call the superclasses initializer
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        budgetManager = [BGBudgetManager sharedManager];
        budgetItemManager = [BGBudgetItemManager sharedManager];
        [self refreshAndReload];
    }

    // add observers
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshAndReload) name:BGSelectedBudgetWasChanged object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshAndReload) name:BGTransactionWasUpdated object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshAndReload) name:BGTransactionWasDeleted object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshAndReload) name:BGTransactionWasCreated object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onBudgetItemAdded:) name:BGBudgetItemWasCreated object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onBudgetItemDeleted:) name:BGBudgetItemWasDeleted object:nil];

    return self;
}

// this will make sure we use the grouped style
// no matter what
- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad
{
    [self.navigationItem setTitle:@"budgey"];

    UIBarButtonItem *leftViewButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"259-list.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(onLeftViewButtonClicked)];
    [self.navigationItem setLeftBarButtonItem:leftViewButton];

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
    UITableViewCell *cell;

    // is it the summary?
    if ([indexPath section] == 0) {
        summaryCell = [[SummaryTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SummaryTableCell"];
        cell = summaryCell;
    }
    else { // regular budget item cell
        currentCell = [[BudgetTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BudgetTableCell"];

        // lookup the budget item for the cell
        BGBudgetItem *budgetItem = [self budgetItemFromIndexPath:indexPath];
        [currentCell setBudgetItem:budgetItem];

        cell = currentCell;
    }

    // workaround to get border off of the grouped cells
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [BGColorUtil colorWithHexString:@"d4d4d4"];
    cell.backgroundView = backView;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // is it the summary?
    if ([indexPath section] == 0)
        return 58;
    else
        return 44;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [categories count] + 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // is it the summary?
    if (section == 0) {
        return 1 ;
    }
    else {

        BGCategory *category = [categories objectAtIndex:section-1];
        return category.budgetItems.count;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
#if TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
    // push a new view when we select
    if (budgetItemListViewController == nil)
        budgetItemListViewController = [[BudgetItemListViewController alloc] initWithBudgetItem:[self budgetItemFromIndexPath:indexPath]];
    else
        [budgetItemListViewController setBudgetItem:[self budgetItemFromIndexPath:indexPath]];

    [(UINavigationController *)self.parentViewController pushViewController:budgetItemListViewController animated:YES];
#else
    // Do Nothing for now, we need to convert these over to make them compatible
    // but for now we need to continue work on the iphone version
#endif


}

//---------------------------------------------------
//  Header and Footer
//---------------------------------------------------
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // is it the summary?
    if (section == 0) {
        summaryHeaderView = [[SummaryHeaderView alloc] init];
        return summaryHeaderView;
    }
    else {
        // init the view class
        currentHeaderView = [[BudgetHeaderView alloc] init];
        [currentHeaderView setTitle:[[categories objectAtIndex:section-1] name]];
        return currentHeaderView;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    // is it the summary?
    if (section == 0) {
        summaryFooterView = [[SummaryFooterView alloc] init];
        return summaryFooterView;
    }
    else {
        currentFooterView = [[BudgetFooterView alloc] init];
        [currentFooterView setCategory:[categories objectAtIndex:section-1]];
        return currentFooterView;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    // is it the summary?
    if (section == 0) {
        return 198;
    } else {
        return 67;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    // is it the summary?
    if (section == 0) {
        return 62;
    } else {
        return 75;
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        BGBudgetItem *budgetItem = [self budgetItemFromIndexPath:indexPath];
        if (budgetItem) {
            deletedIndexPath = indexPath;
            [budgetItemManager deleteBudgetItem:budgetItem];
        }
    }
}

//---------------------------------------------------
//  Actions
//---------------------------------------------------
- (void)onLeftViewButtonClicked
{
    [[NSNotificationCenter defaultCenter] postNotificationName:BGRevealLeftView object:self];
}

- (void)refresh
{
    // the selected budget has been updated, lets update our UI
    // sort our categories by name
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    categories = [[budgetManager.selectedBudget categories] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}

- (void)refreshAndReload
{
    [self refresh];
    [self.tableView reloadData];
}

- (void)onBudgetItemAdded:(NSNotification *)notification
{
    // refresh the datasource
    [self refresh];

    BGBudgetItem *budgetItem = [notification object];

    if (budgetItem) {
        NSIndexPath *path = [self indexPathFromBudgetItem:budgetItem];
        [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)onBudgetItemDeleted:(NSNotification *)notification
{
    if (!deletedIndexPath)
        return;

    NSIndexPath *path = deletedIndexPath;

    // refresh the datasource
    [self refresh];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (BGBudgetItem *)budgetItemFromIndexPath:(NSIndexPath *)indexPath
{
    BGCategory *category = [categories objectAtIndex:indexPath.section-1];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *budgetItems = [[category budgetItems] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    BGBudgetItem *budgetItem = [budgetItems objectAtIndex:[indexPath row]];

    return budgetItem;
}

- (NSIndexPath *)indexPathFromBudgetItem:(BGBudgetItem *)budgetItem
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];

    // loop over each category and sort the budget items and look for
    // the index of the particular budget item
    for (int i = 0; i < categories.count; i++) {
        BGCategory *category = [categories objectAtIndex:i];
        NSArray *budgetItems = [[category budgetItems] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];

        if ([budgetItems containsObject:budgetItem])
        {
            return [NSIndexPath indexPathForRow:[budgetItems indexOfObject:budgetItem] inSection:i+1];
        }
    }

    [NSException raise:@"Budget Item does not exist in budget" format:@""];
}


@end