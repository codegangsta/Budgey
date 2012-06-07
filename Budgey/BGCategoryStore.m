//
// Created by jeremysaenz on 6/4/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BGCategoryStore.h"


@implementation BGCategoryStore

+ (BGCategoryStore *)sharedStore
{
    static BGCategoryStore *sharedStore = nil;

    if (!sharedStore)
        sharedStore = [[super allocWithZone:nil] init];

    return sharedStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

- (id)init
{
    self = [super init];

    if (self) {
        allCategories = [[NSMutableArray alloc] init];
    }

    return self;
}

- (NSArray *)allCategories
{
    return allCategories;
}

- (NSString *)createCategory
{
    NSString *cat = [NSString stringWithFormat:@"Category: %i", [allCategories count] + 1];
    [allCategories addObject:cat];

    return cat;
}


@end