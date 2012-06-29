//
// Created by jeremysaenz on 6/28/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "UUIDUtil.h"


@implementation UUIDUtil

+(NSString*)UUIDString
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    //return (NSString *)string;
}

@end