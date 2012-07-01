//
// Created by jeremysaenz on 6/30/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BGTransactionManager.h"
#import "BGTransaction.h"
#import "BGBudgetItem.h"


@implementation BGTransactionManager
{

}

+ (BGTransactionManager *)sharedManager
{
    static BGTransactionManager *sharedManager = nil;

    if (!sharedManager)
        sharedManager = [[super allocWithZone:nil] init];

    return sharedManager;
}

- (BGTransaction *)createTransactionWithName:(NSString *)name andDate:(NSDate *)date andAmount:(NSNumber *)amount forBudgetItem:(BGBudgetItem *)budgetItem
{
    BGTransaction *transaction = [BGTransaction MR_createEntity];
    transaction.name = name;
    transaction.date = [date timeIntervalSince1970];
    transaction.amount = [NSDecimalNumber decimalNumberWithDecimal:[amount decimalValue]];

    // link to a budget item
    [budgetItem addTransactionsObject:transaction];

    // save it and post notification
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_save];
    [[NSNotificationCenter defaultCenter] postNotificationName:BGTransactionWasCreated object:transaction];

    return transaction;
}

- (void)deleteTransaction:(BGTransaction *)transaction
{
    [transaction MR_deleteEntity];

    // save it and post notification
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_save];
    [[NSNotificationCenter defaultCenter] postNotificationName:BGTransactionWasDeleted object:transaction];
}

- (void)updateTransaction:(BGTransaction *)transaction
{
    // save it and post notification
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_save];
    [[NSNotificationCenter defaultCenter] postNotificationName:BGTransactionWasUpdated object:transaction];
}


+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedManager];
}



@end