//
// Created by jeremysaenz on 6/4/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CategoryListViewController.h"
#import "BGColorUtil.h"
#import "QuartzCore/CALayer.h"
#import "BudgetItemListViewController.h"
#import "BGShadowUtil.h"
#import "BGBudgetManager.h"
#import "BGBudget.h"
#import "BGCategory.h"
#import "BudgetHeaderView.h"
#import "BudgetTableCell.h"
#import "BGBudgetItem.h"

@implementation CategoryListViewController
{
    BGBudgetManager *budgetManager;
    BudgetItemListViewController *budgetItemListViewController;
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
        [self refresh];
    }

    // add observers
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh) name:BGSelectedBudgetWasChanged object:nil];

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
        [[UINib nibWithNibName:@"SummaryIncomeTableCell" bundle:nil] instantiateWithOwner:self options:nil];
        cell = summaryCell;
    }
    else { // regular budget item cell
        [[UINib nibWithNibName:@"BudgetTableCell" bundle:nil] instantiateWithOwner:self options:nil];

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
    // push a new view when we select
    if (budgetItemListViewController == nil)
        budgetItemListViewController = [[BudgetItemListViewController alloc] initWithBudgetItem:[self budgetItemFromIndexPath:indexPath]];
    else
        [budgetItemListViewController setBudgetItem:[self budgetItemFromIndexPath:indexPath]];

    [(UINavigationController *)self.parentViewController pushViewController:budgetItemListViewController animated:YES];
}

//---------------------------------------------------
//  Header and Footer
//---------------------------------------------------
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // is it the summary?
    if (section == 0) {
        [[UINib nibWithNibName:@"SummaryHeaderView" bundle:nil] instantiateWithOwner:self options:nil];
        return summaryHeaderView;
    }
    else {
        [[UINib nibWithNibName:@"BudgetHeaderView" bundle:nil] instantiateWithOwner:self options:nil];
        [currentHeaderView setTitle:[[categories objectAtIndex:section-1] name]];
        return currentHeaderView;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    // is it the summary?
    if (section == 0) {
        [[UINib nibWithNibName:@"SummaryFooterView" bundle:nil] instantiateWithOwner:self options:nil];
        return summaryFooterView;
    }
    else {
        [[UINib nibWithNibName:@"BudgetFooterView" bundle:nil] instantiateWithOwner:self options:nil];
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

    [self.tableView reloadData];
}

- (BGBudgetItem *)budgetItemFromIndexPath:(NSIndexPath *)indexPath
{
    BGCategory *category = [categories objectAtIndex:indexPath.section-1];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *budgetItems = [[category budgetItems] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    BGBudgetItem *budgetItem = [budgetItems objectAtIndex:[indexPath row]];

    return budgetItem;
}


@end