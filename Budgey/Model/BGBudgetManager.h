//
// Created by jeremysaenz on 6/23/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class NSManagedObjectContext;
@class NSManagedObjectModel;

/**
 * Manages and abstracts CoreData calls. Allows
 * the ability to access budgets
 */
@interface BGBudgetManager : NSObject {
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}

@end