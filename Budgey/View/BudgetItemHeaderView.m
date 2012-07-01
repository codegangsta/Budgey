//
// Created by jeremysaenz on 6/30/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BudgetItemHeaderView.h"
#import "BGBudgetItem.h"


@implementation BudgetItemHeaderView
@synthesize budgetItem;
@synthesize spentLabel;
@synthesize budgetedLabel;
@synthesize titleLabel;

- (void)setBudgetItem:(BGBudgetItem *)aBudgetItem
{
    budgetItem = aBudgetItem;

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setCurrencySymbol:@"$"];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];

    [titleLabel setText:[aBudgetItem name]];
    [spentLabel setText:[formatter stringFromNumber:[aBudgetItem amountSpent]]];
    [budgetedLabel setText:[formatter stringFromNumber:[aBudgetItem amount]]];
}

@end