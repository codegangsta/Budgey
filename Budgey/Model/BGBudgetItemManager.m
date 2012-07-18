//
// Created by jeremysaenz on 7/18/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BGBudgetItemManager.h"
#import "BGBudgetItem.h"
#import "BGCategory.h"


@implementation BGBudgetItemManager
@synthesize selectedBudgetItem;

//---------------------------------------------------
//  Static Functions
//---------------------------------------------------
+ (BGBudgetItemManager *)sharedManager
{
    static BGBudgetItemManager *sharedManager = nil;

    if (!sharedManager)
        sharedManager = [[super allocWithZone:nil] init];

    return sharedManager;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedManager];
}

//---------------------------------------------------
//  CRUD Operations
//---------------------------------------------------
- (BGBudgetItem *)createBudgetItemWithName:(NSString *)name andAmount:(NSNumber *)amount forCategory:(BGCategory *)category
{
    BGBudgetItem *budgetItem = [BGBudgetItem MR_createEntity];
    budgetItem.name = name;
    budgetItem.amount = [NSDecimalNumber decimalNumberWithDecimal:[amount decimalValue]];

    // link to a category
    [category addBudgetItemsObject:budgetItem];

    // save it and post a notification
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_save];
    [[NSNotificationCenter defaultCenter] postNotificationName:BGBudgetItemWasCreated object:budgetItem];

    return budgetItem;
}

- (void)deleteBudgetItem:(BGBudgetItem *)budgetItem
{
    [budgetItem MR_deleteEntity];

    // save and post notification
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_save];
    [[NSNotificationCenter defaultCenter] postNotificationName:BGBudgetItemWasDeleted object:budgetItem];
}

- (void)updateBudgetItem:(BGBudgetItem *)budgetItem
{
    // do validation here if any is needed

    // save and post notification
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_save];
    [[NSNotificationCenter defaultCenter] postNotificationName:BGBudgetItemWasUpdated object:budgetItem];
}


@end