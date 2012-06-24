//
//  BGTransaction.h
//  Budgey
//
//  Created by Jeremy Saenz on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BGBudgetItem;

@interface BGTransaction : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber * amount;
@property (nonatomic) NSTimeInterval date;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) BGBudgetItem *budgetItem;

@end
