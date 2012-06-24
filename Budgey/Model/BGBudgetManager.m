//
// Created by jeremysaenz on 6/23/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <CoreData/CoreData.h>
#import "BGBudgetManager.h"


@implementation BGBudgetManager

- (id)init
{
    self = [super init];

    if (self) {

        // read in Budgey.xcdatamodeld
        model = [NSManagedObjectModel mergedModelFromBundles:nil];

        NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];

        // Where does the SQLite file go?
        NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [[documentDirectories objectAtIndex:0] stringByAppendingString:@"store.data"];

        NSURL *storeURL = [NSURL fileURLWithPath:path];

        NSError *error = nil;
        if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
            [NSException raise:@"Open failed" format:@"Reason: %@", [error localizedDescription]];
        }

        // Create the managed object description
        context = [[NSManagedObjectContext alloc] init];
        [context setPersistentStoreCoordinator:persistentStoreCoordinator];

        // we don't need undo
        [context setUndoManager:nil];
    }

    return self;
}

@end