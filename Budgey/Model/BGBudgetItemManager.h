//
// Created by jeremysaenz on 7/18/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BGManager.h"

@class BGBudgetItem;
@class BGCategory;


@interface BGBudgetItemManager : BGManager

// the currently or last selected Budget Item
@property (nonatomic, strong) BGBudgetItem *selectedBudgetItem;

+(BGBudgetItemManager *)sharedManager;

// create a budget item
-(BGBudgetItem *)createBudgetItemWithName:(NSString *)name andAmount:(NSNumber *)amount forCategory:(BGCategory *)category;

// delete budget item
-(void)deleteBudgetItem:(BGBudgetItem *)budgetItem;

// validates and saves the budget item passed in
-(void)updateBudgetItem:(BGBudgetItem *)budgetItem;

@end