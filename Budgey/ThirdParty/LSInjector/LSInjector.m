//
// Created by jeremysaenz on 6/12/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "LSInjector.h"
#import <objc/runtime.h>

@implementation LSInjector

- (id)init
{
    self = [super init];
    dependencyMap = [[NSMutableDictionary alloc] init];

    return self;
}

- (void)map:(NSObject *)object toClass:(Class)class
{
    [dependencyMap setObject:object forKey:NSStringFromClass(class)];
}

- (NSObject *)get:(Class)class
{
    return [dependencyMap objectForKey:NSStringFromClass(class)];
}

- (void)apply:(NSObject *)object
{
    // get the list of properties in the object
    unsigned int i, count = 0;
    objc_property_t *properties = class_copyPropertyList([object class], &count);

    if (count == 0) {
        free(properties);
    }

    for (i = 0; i < count; i++) {
        // look up each property and apply the appropriate
        // value to requests for injection. Otherwise throw an
        // error
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(properties[i])];
        NSString *propertyType = [NSString stringWithUTF8String:property_getTypeString(properties[i])];

        if ([propertyType hasPrefix:@"@"] && [propertyName hasPrefix:@"$"]) {
            // string replacement from objective-c objects
            propertyType = [propertyType stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"@\""]];

            NSObject *dependency = [dependencyMap objectForKey:propertyType];
            if (dependency == nil) {
                [NSException raise:@"Property cannot be fulfilled" format:@"property %@ of type %@ cannot be fulfilled because the type is not mapped to this injector.", propertyName, propertyType];
            }
            else {
                [object setValue:dependency forKey:propertyName];
            }
        }
    }

    // free our property objects
    free(properties);
}

const char *property_getTypeString(objc_property_t property)
{
    const char *attrs = property_getAttributes(property);
    if (attrs == NULL)
        return (NULL);

    static char buffer[256];
    const char *e = strchr(attrs, ',');
    if (e == NULL)
        return (NULL);

    int len = (int) (e - attrs);
    memcpy( buffer, attrs + 1, len - 1 );
    buffer[len] = '\0';

    return (buffer);
}


@end