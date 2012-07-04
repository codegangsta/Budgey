//
// Created by jeremysaenz on 6/4/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class BudgetHeaderView;
@class BudgetTableCell;
@class BGBudgetItem;
@class BudgetFooterView;

//  View controller for a Budget category table that
//  shows up in the main view in Budgey
@interface CategoryListViewController : UITableViewController {
@protected
    //---------------------------------------------------
    //  Data
    //---------------------------------------------------
    NSArray *categories;
}

-(void)refresh;

-(BGBudgetItem *)budgetItemFromIndexPath:(NSIndexPath *)indexPath;

// this is a workaround to use xibs to define our header, footer
// and cell view instances via xibs
@property (nonatomic, strong) IBOutlet BudgetHeaderView *currentHeaderView;
@property (nonatomic, strong) IBOutlet BudgetFooterView *currentFooterView;
@property (nonatomic, strong) IBOutlet BudgetTableCell *currentCell;

@property (nonatomic, strong) IBOutlet UIView *summaryHeaderView;
@property (nonatomic, strong) IBOutlet UIView *summaryFooterView;
@property (nonatomic, strong) IBOutlet UITableViewCell *summaryCell;

@end