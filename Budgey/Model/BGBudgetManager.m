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

- (BGBudget *)createBudgetWithName:(NSString *)name andDate:(NSDate *)date
{
    BGBudget *budget = [BGBudget MR_createEntity];
    budget.name = name;
    budget.date = [date timeIntervalSince1970];

    // save this new budget
    [self save];

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

    [self save];

    return budget;
}

- (NSArray *)findAll
{
    return [BGBudget MR_findAll];
}

@end