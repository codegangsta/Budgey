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
extern NSString *const BGRevealLeftView;
extern NSString *const BGShowCreateBudgetView;

//---------------------------------------------------
//  BGBudget Functions
//---------------------------------------------------
extern NSString *const BGBudgetWasUpdated;
extern NSString *const BGBudgetWasCreated;
extern NSString *const BGBudgetWasDeleted;
extern NSString *const BGSelectedBudgetWasChanged;

