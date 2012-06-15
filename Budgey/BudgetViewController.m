//
// Created by jeremysaenz on 6/14/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BudgetViewController.h"


@implementation BudgetViewController

- (id)init
{
    self = [super init];

    [self.navigationBar setBarStyle:UIBarStyleBlack];

    UIFont *museo900 = [UIFont fontWithName:@"Museo" size:20];
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithDictionary:[self.navigationBar titleTextAttributes]];
    [attributes setValue:museo900 forKey:UITextAttributeFont];
    [self.navigationBar setTitleTextAttributes:attributes];

    return self;
}

@end