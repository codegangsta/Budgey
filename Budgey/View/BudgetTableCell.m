//
// Created by jeremysaenz on 6/30/12.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "BudgetTableCell.h"
#import "BGBudgetItem.h"

@implementation BudgetTableCell

@synthesize nameLabel;
@synthesize budgetedLabel;
@synthesize spentLabel;
@synthesize budgetItem;

- (void)setBudgetItem:(BGBudgetItem *)aBudgetItem
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setCurrencySymbol:@"$"];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];

    [nameLabel setText:[aBudgetItem name]];
    [budgetedLabel setText:[formatter stringFromNumber:[aBudgetItem amount]]];
    [spentLabel setText:[formatter stringFromNumber:[NSNumber numberWithFloat:0.00]]];
}

@end