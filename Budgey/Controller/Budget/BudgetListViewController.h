//
// Created by jeremysaenz on 6/4/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

//  View controller for a Budget category table that
//  shows up in the main view in Budgey
@interface BudgetListViewController : UITableViewController {
@protected
    UIView *currentHeaderView;
    UIView *currentFooterView;
    UITableViewCell *currentCell;
}

// this is a workaround to use xibs to define our header, footer
// and cell view instances via xibs
@property (nonatomic, strong) IBOutlet UIView *currentHeaderView;
@property (nonatomic, strong) IBOutlet UIView *currentFooterView;
@property (nonatomic, strong) IBOutlet UITableViewCell *currentCell;

@end