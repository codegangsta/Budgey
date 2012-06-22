//
// Created by jeremysaenz on 6/21/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface BudgetItemListViewController : UITableViewController {
@protected
    UIView *currentHeaderView;
    UIView *currentFooterView;
    UITableViewCell *currentCell;
}

@property (nonatomic, strong) IBOutlet UIView *currentHeaderView;
@property (nonatomic, strong) IBOutlet UIView *currentFooterView;
@property (nonatomic, strong) IBOutlet UITableViewCell *currentCell;

@end