//
// Created by jeremysaenz on 6/4/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface BGCategoryStore : NSObject {
    NSMutableArray *allCategories;
}

+ (BGCategoryStore *)sharedStore;

- (NSArray *)allCategories;
- (NSString *)createCategory;

@end