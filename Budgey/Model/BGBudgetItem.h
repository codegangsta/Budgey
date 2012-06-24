//
//  BGBudgetItem.h
//  Budgey
//
//  Created by Jeremy Saenz on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BGCategory;

@interface BGBudgetItem : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDecimalNumber * amount;
@property (nonatomic, retain) BGCategory *category;
@property (nonatomic, retain) NSSet *transactions;
@end

@interface BGBudgetItem (CoreDataGeneratedAccessors)

- (void)addTransactionsObject:(NSManagedObject *)value;
- (void)removeTransactionsObject:(NSManagedObject *)value;
- (void)addTransactions:(NSSet *)values;
- (void)removeTransactions:(NSSet *)values;

@end
