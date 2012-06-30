//
// Created by jeremysaenz on 6/30/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class BGBudgetItem;


@interface BudgetTableCell : UITableViewCell

@property (nonatomic, strong) IBOutlet BGBudgetItem *budgetItem;

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *budgetedLabel;
@property (nonatomic, strong) IBOutlet UILabel *spentLabel;

@end