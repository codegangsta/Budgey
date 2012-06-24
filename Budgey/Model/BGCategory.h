//
//  BGCategory.h
//  Budgey
//
//  Created by Jeremy Saenz on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BGBudget;

@interface BGCategory : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) BGBudget *budget;
@property (nonatomic, retain) NSSet *budgetItems;
@end

@interface BGCategory (CoreDataGeneratedAccessors)

- (void)addBudgetItemsObject:(NSManagedObject *)value;
- (void)removeBudgetItemsObject:(NSManagedObject *)value;
- (void)addBudgetItems:(NSSet *)values;
- (void)removeBudgetItems:(NSSet *)values;

@end
