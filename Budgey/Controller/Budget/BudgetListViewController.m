//
// Created by jeremysaenz on 6/4/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BudgetListViewController.h"
#import "BGCategoryStore.h"
#import "BGColorUtil.h"
#import "QuartzCore/CALayer.h"
#import "BudgetItemListViewController.h"
#import "BGShadowUtil.h"

@implementation BudgetListViewController
@synthesize currentFooterView;
@synthesize currentCell;
@synthesize currentHeaderView;


- (id)init
{
    // call the superclasses initializer
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // create our categories for our datasource
        for (int j = 0; j < 5; j++) {
            [[BGCategoryStore sharedStore] createCategory];
        }
    }

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
    NSString *nibName;

    // is it the summary?
    if ([indexPath section] == 0) {
        // return the right cell based on the index
        if ([indexPath row] == 0) {
            nibName = @"SummaryIncomeTableCell";
        }
        else if([indexPath row] == 1) {
            nibName = @"SummarySpentTableCell";
        }
        else {
            nibName = @"SummaryProgressTableCell";
        }
    }
    else {
        nibName = @"BudgetTableCell";
    }

    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    [nib instantiateWithOwner:self options:nil];

    // workaround to get border off of the grouped cells
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [BGColorUtil colorWithHexString:@"d4d4d4"];
    currentCell.backgroundView = backView;

    return currentCell;
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
    return [[[BGCategoryStore sharedStore] sections] count] + 1;
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
        NSString *currentSection = [[[BGCategoryStore sharedStore] sections] objectAtIndex:section-1];
        return [[[BGCategoryStore sharedStore] categoriesForSection:currentSection] count];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // push a new view when we select
    UIViewController *budgetItemListController = [[BudgetItemListViewController alloc] init];
    [(UINavigationController *)self.parentViewController pushViewController:budgetItemListController animated:YES];
}

//---------------------------------------------------
//  Header and Footer
//---------------------------------------------------
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *nibName;

    // is it the summary?
    if (section == 0) {
        nibName = @"SummaryHeaderView";
    }
    else {
        nibName = @"BudgetHeaderView";
    }

    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    [nib instantiateWithOwner:self options:nil];
    return currentHeaderView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    NSString *nibName;

    // is it the summary?
    if (section == 0) {
        nibName = @"SummaryFooterView";
    }
    else {
        nibName = @"BudgetFooterView";
    }

    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    [nib instantiateWithOwner:self options:nil];
    return currentFooterView;
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

@end