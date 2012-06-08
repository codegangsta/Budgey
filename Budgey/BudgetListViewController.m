//
// Created by jeremysaenz on 6/4/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BudgetListViewController.h"
#import "BGCategoryStore.h"
#import "BGColorUtil.h"


@implementation BudgetListViewController

- (id)init
{
    // call the superclasses initializer
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // create our categories for our datasource
        for (int j = 0; j < 7; j++) {
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
    // set a clear color for the background since we
    // want a consistent background throughout the app
    self.tableView.backgroundColor = [UIColor clearColor];
}

//---------------------------------------------------
//  Data Source Methods
//---------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // create an instance of UITableViewCell with default appearance
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];

    // get the category and set the text in the cell
    NSString *currentSection = [[[BGCategoryStore sharedStore] sections] objectAtIndex:[indexPath section]];
    NSDictionary *category = [[[BGCategoryStore sharedStore] categoriesForSection:currentSection] objectAtIndex:[indexPath row]];

    [[cell textLabel] setText:[category objectForKey:@"name"]];

    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = [BGColorUtil colorWithHexString:@"dfdfdf"];

    [cell setBackgroundView:backgroundView];
    cell.contentView.alpha = 0;

    return cell;
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

//---------------------------------------------------
//  Header and Footer
//---------------------------------------------------
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *header = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header.png"]];
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIImageView *footer = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"footer.png"]];
    return footer;
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