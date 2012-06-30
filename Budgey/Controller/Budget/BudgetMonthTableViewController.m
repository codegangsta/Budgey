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
    NSInteger selectedRow;
}

@synthesize tableView = _tableView;

//---------------------------------------------------
//  Initialization
//---------------------------------------------------
- (id)init
{
    self = [super initWithNibName:@"BudgetMonthTableViewController" bundle:nil];

    manager = [BGBudgetManager sharedManager];
    budgets = [manager findAll];

    if ([budgets count] > 0)
        [manager setSelectedBudget:[budgets objectAtIndex:0]];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onBudgetAdded:) name:BGBudgetWasCreated object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onBudgetDeleted:) name:BGBudgetWasDeleted object:nil];

    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    // set the frame to be a width of 250
    CGRect frame = [self.view frame];
    frame.size.width = 250;
    [self.view setFrame:frame];
}

//---------------------------------------------------
//  Data Methods
//---------------------------------------------------
- (void)refresh
{
    budgets = [manager findAll];
    // TODO: Here we can generate month data and put it into an array
    // to use as sections as we reload the list
    //[self.tableView reloadData];
}

- (void)selectRow:(NSInteger)row
{
    UITableViewCell *oldCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:selectedRow inSection:0]];
    [oldCell setAccessoryType:UITableViewCellAccessoryNone];
    selectedRow = row;
    UITableViewCell *newCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:selectedRow inSection:0]];
    [newCell setAccessoryType:UITableViewCellAccessoryCheckmark];

    // select the budget in the model
    [manager setSelectedBudget:[budgets objectAtIndex:row]];
}


//---------------------------------------------------
//  Actions
//---------------------------------------------------
- (IBAction)addButtonClick:(id)sender
{
    // show the CreateBudgetWindow
    [[NSNotificationCenter defaultCenter] postNotificationName:BGShowCreateBudgetView object:self];
}

- (void)onBudgetAdded:(NSNotification *)notification
{
    // refresh the datasource
    [self refresh];

    BGBudget *budget = [notification object];

    if (budget) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:[budgets indexOfObject:budget] inSection:0];
        [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)onBudgetDeleted:(NSNotification *)notification
{
    BGBudget *budget = [notification object];
    NSIndexPath *path = [NSIndexPath indexPathForRow:[budgets indexOfObject:budget] inSection:0];

    // refresh the datasource
    [self refresh];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationAutomatic];

    if ([path row] == selectedRow && [budgets count] > 0)
        [self selectRow:0];
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
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    if ([indexPath row] == selectedRow)
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];

    BGBudget *budget = [budgets objectAtIndex:[indexPath row]];
    cell.text = budget.name;

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        BGBudget *budget = [budgets objectAtIndex:[indexPath row]];
        if (budget) {
            [manager deleteBudget:budget];
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self selectRow:[indexPath row]];
}

@end