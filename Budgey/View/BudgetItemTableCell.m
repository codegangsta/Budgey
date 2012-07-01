//
// Created by jeremysaenz on 6/30/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BudgetItemTableCell.h"
#import "BGTransaction.h"


@implementation BudgetItemTableCell
@synthesize dateLabel;
@synthesize nameLabel;
@synthesize amountLabel;
@synthesize transaction;

- (void)setTransaction:(BGTransaction *)aTransaction
{
    transaction = aTransaction;

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setCurrencySymbol:@"-$"];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];

    [nameLabel setText:[aTransaction name]];
    [amountLabel setText:[formatter stringFromNumber:[aTransaction amount]]];
    [dateLabel setText:[dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[aTransaction date]]]];

}

@end