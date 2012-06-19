#import <Foundation/Foundation.h>
#import <objc/runtime.h>

/**
 * A dependency injection system for objective-c.
 * An instance of this class allows dependencies to be
 * injected into properties of an object based on objective-c's
 * introspection features.
 *
 * So far this class is built to take advantage of ARC in the compiler.
 * If your project is not using ARC then you must compile this separately
 * as a framework using ARC.
 */
@interface LSInjector : NSObject
{
    NSMutableDictionary *dependencyMap;
}

/**
 * Maps an object to the dependency map, using the class parameter
 * message result as an identifier for the object in the map.
 */
- (void)map:(NSObject *)object toClass:(Class)class;

/**
 * Returns the object in the dependency map that is identified by the
 * class passed as a parameter. Returns nil if the class/object mapping
 * does not exist.
 */
- (NSObject *)get:(Class)class;

/**
 * Applies injection on the object parameter. Fulfilling all properties
 * and accessor methods that contain the injector prefix ($ by default)
 *
 * If a property on the object has a prefix but it's type does not show up
 * in the dependency map, this method will throw an exception.
 */
- (void)apply:(NSObject *)object;

@end

// returns a static buffer - copy the string to retain it, as it will
// be overwritten on the next call to this function
const char *property_getTypeString(objc_property_t property);