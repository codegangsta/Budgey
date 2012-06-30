//
// Created by jeremysaenz on 6/30/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BudgetHeaderView.h"


@implementation BudgetHeaderView
@synthesize title;
@synthesize titleLabel;


// sets the title of the header view
- (void)setTitle:(NSString *)aTitle
{
    title = aTitle;
    [titleLabel setText:title];
}

@end