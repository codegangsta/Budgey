//
// Created by jeremysaenz on 6/21/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class BGBudgetItem;
@class BudgetItemTableCell;

@interface BudgetItemListViewController : UITableViewController

@property (nonatomic, strong) IBOutlet UIView *currentHeaderView;
@property (nonatomic, strong) IBOutlet UIView *currentFooterView;
@property (nonatomic, strong) IBOutlet BudgetItemTableCell *currentCell;

@property (nonatomic, strong) BGBudgetItem *budgetItem;

- (id)initWithBudgetItem:(BGBudgetItem *)aBudgetItem;

- (void)refresh;

@end