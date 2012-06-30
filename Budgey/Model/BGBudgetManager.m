//
// Created by jeremysaenz on 6/28/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BGBudgetManager.h"
#import "BGBudget.h"
#import "BGCategory.h"
#import "BGBudgetItem.h"


@implementation BGBudgetManager

//---------------------------------------------------
//  Static Functions
//---------------------------------------------------
+ (BGBudgetManager *)sharedManager
{
    static BGBudgetManager *sharedManager = nil;

    if (!sharedManager)
        sharedManager = [[super allocWithZone:nil] init];

    return sharedManager;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedManager];
}

- (BGBudget *)createBudgetWithName:(NSString *)name andDate:(NSDate *)date
{
    BGBudget *budget = [BGBudget MR_createEntity];
    budget.name = name;
    budget.date = [date timeIntervalSince1970];

    // save this new budget
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_save];
    [[NSNotificationCenter defaultCenter] postNotificationName:BGBudgetWasCreated object:budget];

    return budget;
}

- (BGBudget *)createBudgetFromDefaultTemplate:(NSString *)name andDate:(NSDate *)date
{
    BGBudget *budget = [self createBudgetWithName:name andDate:date];

    // the default template will just be here for now
    BGCategory *personalCategory = [BGCategory MR_createEntity];
    personalCategory.name = @"Personal";
    [budget addCategoriesObject:personalCategory];

    BGCategory *businessCategory = [BGCategory MR_createEntity];
    businessCategory.name = @"Business";
    [budget addCategoriesObject:businessCategory];

    BGBudgetItem *jeremyBusiness = [BGBudgetItem MR_createEntity];
    jeremyBusiness.name = @"Jeremy Business";
    [businessCategory addBudgetItemsObject:jeremyBusiness];

    BGBudgetItem *lizzieBusiness = [BGBudgetItem MR_createEntity];
    lizzieBusiness.name = @"Lizzie Business";
    [businessCategory addBudgetItemsObject:lizzieBusiness];

    BGBudgetItem *test = [BGBudgetItem MR_createEntity];
    test.name = @"Test";
    [personalCategory addBudgetItemsObject:test];

    BGBudgetItem *clothing = [BGBudgetItem MR_createEntity];
    clothing.name = @"clothing";
    [personalCategory addBudgetItemsObject:clothing];

    [self updateBudget:budget];

    return budget;
}

- (void)deleteBudget:(BGBudget *)budget
{
    [budget MR_deleteEntity];
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_save];
    [[NSNotificationCenter defaultCenter] postNotificationName:BGBudgetWasDeleted object:budget];
}

- (void)updateBudget:(BGBudget *)budget
{
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_save];
    [[NSNotificationCenter defaultCenter] postNotificationName:BGBudgetWasUpdated object:budget];
}

- (NSArray *)findAll
{
    return [BGBudget MR_findAll];
}

@end