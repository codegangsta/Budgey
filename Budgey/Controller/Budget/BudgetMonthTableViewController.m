//
// Created by jeremysaenz on 6/23/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BudgetMonthTableViewController.h"
#import "BGBudgetManager.h"
#import "BGBudget.h"


@implementation BudgetMonthTableViewController
{
    NSArray *budgets;
    BGBudgetManager *manager;
}

//---------------------------------------------------
//  Initialization
//---------------------------------------------------
- (id)init
{
    self = [super initWithStyle:UITableViewStylePlain];

    // make this a singleton or injected
    manager = [[BGBudgetManager alloc] init];
    budgets = [manager findAll];

    return self;
}

- (void)refresh
{
    budgets = [manager findAll];
    // TODO: Here we can generate month data and put it into an array
    // to use as sections as we reload the list
    [self.tableView reloadData];
}

//---------------------------------------------------
//  UITableViewDelegate Methods
//---------------------------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [budgets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BudgetCell"];
    BGBudget *budget = [budgets objectAtIndex:[indexPath row]];
    cell.text = budget.name;

    return cell;
}


@end