//
// Created by jeremysaenz on 6/28/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BGManager.h"

@class BGBudget;

@interface BGBudgetManager : BGManager

// the currently selected budget in the application
@property (nonatomic, strong) BGBudget *selectedBudget;

+ (BGBudgetManager *)sharedManager;

// Creates a budget item
-(BGBudget *)createBudgetWithName:(NSString *)name andDate:(NSDate *)date;

// creates a budget from a default template in the application
-(BGBudget *)createBudgetFromDefaultTemplate:(NSString *)name andDate:(NSDate *)date;

// deletes the budget passed in
-(void)deleteBudget:(BGBudget *)budget;

// validates and saves the budget passed in
-(void)updateBudget:(BGBudget *)budget;

@end