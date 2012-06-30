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

@synthesize tableView = _tableView;

//---------------------------------------------------
//  Initialization
//---------------------------------------------------
- (id)init
{
    self = [super initWithNibName:@"BudgetMonthTableViewController" bundle:nil];

    manager = [BGBudgetManager sharedManager];
    budgets = [manager findAll];

    self.navigationController.toolbarHidden = NO;

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

//---------------------------------------------------
//  Actions
//---------------------------------------------------
- (IBAction)addButtonClick:(id)sender
{
    // show the CreateBudgetWindow
    [[NSNotificationCenter defaultCenter] postNotificationName:BGShowCreateBudgetView object:self];
}

-(void)onBudgetAdded:(NSNotification *)notification
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

@end