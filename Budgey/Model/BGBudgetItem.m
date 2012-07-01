//
//  BGBudgetItem.m
//  Budgey
//
//  Created by Jeremy Saenz on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BGBudgetItem.h"
#import "BGCategory.h"
#import "BGTransaction.h"


@implementation BGBudgetItem

@dynamic name;
@dynamic amount;
@dynamic category;
@dynamic transactions;

- (NSNumber *)amountSpent
{
    float spent = 0.00;
    for (BGTransaction *transaction in [self transactions]) {
        spent += [[transaction amount] floatValue];
    }

    return [NSNumber numberWithFloat:spent];
}


@end
