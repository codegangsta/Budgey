//
// Created by jeremysaenz on 6/4/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface BGCategoryStore : NSObject
{
    NSMutableArray *allCategories;
    NSMutableArray *sections;
}

+ (BGCategoryStore *)sharedStore;

- (NSArray *)allCategories;

- (NSDictionary *)createCategory;

- (NSArray *)sections;

- (NSArray *)categoriesForSection:(NSString *)section;

@end