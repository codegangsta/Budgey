//
// Created by jeremysaenz on 6/30/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class BGBudgetItem;


@interface BudgetItemHeaderView : UIView

@property (nonatomic, strong) IBOutlet UITextField *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *budgetedLabel;
@property (nonatomic, strong) IBOutlet UILabel *spentLabel;

@property (nonatomic, strong) BGBudgetItem *budgetItem;

@end