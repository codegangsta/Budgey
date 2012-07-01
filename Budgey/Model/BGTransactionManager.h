//
// Created by jeremysaenz on 6/30/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BGManager.h"

@class BGTransaction;
@class BGBudgetItem;


@interface BGTransactionManager : BGManager

+ (BGTransactionManager *)sharedManager;

// Creates a transaction
-(BGTransaction *)createTransactionWithName:(NSString *)name andDate:(NSDate *)date andAmount:(NSNumber *)amount forBudgetItem:(BGBudgetItem *)budgetItem;

// deletes the transaction passed in
-(void)deleteTransaction:(BGTransaction *)transaction;

// validates and saves the transaction passed in
-(void)updateTransaction:(BGTransaction *)transaction;

@end