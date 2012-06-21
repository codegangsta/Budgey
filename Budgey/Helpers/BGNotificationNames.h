//
// Created by jeremysaenz on 6/18/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface BGNotificationNames : NSObject
@end

// Fired off by the default notification center
// when the center button in the main toolbar
// was clicked.
extern NSString *const BGCenterButtonWasClicked;
extern NSString *const BGTransactionWasSaved;
extern NSString *const BGTransactionWasCanceled;