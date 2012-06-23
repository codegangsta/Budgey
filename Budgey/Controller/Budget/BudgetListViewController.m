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

    UIBarButtonItem *calendarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"259-list.png"] style:UIBarButtonItemStyleBordered target:nil action:nil];
    [self.navigationItem setLeftBarButtonItem:calendarButton];

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
    // get the category and set the text in the cell
    NSString *currentSection = [[[BGCategoryStore sharedStore] sections] objectAtIndex:[indexPath section]];
    NSDictionary *category = [[[BGCategoryStore sharedStore] categoriesForSection:currentSection] objectAtIndex:[indexPath row]];

    UINib *nib = [UINib nibWithNibName:@"BudgetTableCell" bundle:nil];
    [nib instantiateWithOwner:self options:nil];

    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [BGColorUtil colorWithHexString:@"dfdfdf"];
    currentCell.backgroundView = backView;

    //[[cell textLabel] setText:[category objectForKey:@"name"]];

    return currentCell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[[BGCategoryStore sharedStore] sections] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *sections = [[BGCategoryStore sharedStore] sections];
    return [sections objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *currentSection = [[[BGCategoryStore sharedStore] sections] objectAtIndex:section];
    return [[[BGCategoryStore sharedStore] categoriesForSection:currentSection] count];
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
    UINib *nib = [UINib nibWithNibName:@"BudgetHeaderView" bundle:nil];
    [nib instantiateWithOwner:self options:nil];
    return currentHeaderView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UINib *nib = [UINib nibWithNibName:@"BudgetFooterView" bundle:nil];
    [nib instantiateWithOwner:self options:nil];
    return currentFooterView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 57;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 75;
}

//---------------------------------------------------
//  UITableViewCell Logic
//---------------------------------------------------
@end