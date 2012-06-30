//
// Created by jeremysaenz on 6/23/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface BudgetMonthTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

// refresh the data source and reload rows in the table view
-(void)refresh;

// IBAction when the add button is clicked
-(IBAction)addButtonClick:(id)sender;

@end