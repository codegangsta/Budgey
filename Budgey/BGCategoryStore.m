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
        sections = [NSMutableArray arrayWithObjects:@"Section 1",@"Section 2",nil];
    }

    return self;
}

- (NSArray *)allCategories
{
    return allCategories;
}

- (NSDictionary *)createCategory
{
    NSDictionary *cat = [[NSDictionary alloc] initWithObjectsAndKeys:
            [NSString stringWithFormat:@"Category: %i", [allCategories count] + 1], @"name",
            [sections objectAtIndex:[allCategories count] % [sections count]], @"section",
            nil];


    [allCategories addObject:cat];

    return cat;
}

- (NSArray *)sections
{
    return sections;
}

- (NSArray *)categoriesForSection:(NSString *)section
{
    NSMutableArray *result = [[NSMutableArray alloc] init];

    for (int i = 0; i < [allCategories count]; i++) {
        NSDictionary *category = [allCategories objectAtIndex:i];
        if ([category objectForKey:@"section"] == section)
            [result addObject:category];
    }

    return result;
}


@end