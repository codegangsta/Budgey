//
//  BGBudget.h
//  Budgey
//
//  Created by Jeremy Saenz on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BGCategory;

@interface BGBudget : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic) NSTimeInterval date;
@property (nonatomic, retain) NSSet *categories;
@end

@interface BGBudget (CoreDataGeneratedAccessors)

- (void)addCategoriesObject:(BGCategory *)value;
- (void)removeCategoriesObject:(BGCategory *)value;
- (void)addCategories:(NSSet *)values;
- (void)removeCategories:(NSSet *)values;

@end
