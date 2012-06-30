//
// Created by jeremysaenz on 6/28/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

// A base class that other object managers will inherit from
@interface BGManager : NSObject

// Finds all of the specific object that the manager is managing
-(NSArray *)findAll;

@end