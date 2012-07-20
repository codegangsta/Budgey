//
// Created by jeremysaenz on 7/18/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class BGCategory;


@interface CreateBudgetItemViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) IBOutlet UIButton *saveButton;
@property (nonatomic, strong) IBOutlet UIButton *cancelButton;
@property (nonatomic, strong) IBOutlet UITextField *nameField;
@property (nonatomic, strong) IBOutlet UITextField *budgetField;
@property (nonatomic, strong) IBOutlet UITextField *categoryField;
@property (nonatomic, strong) IBOutlet UILabel *leftToBudgetLabel;
@property (nonatomic, strong) BGCategory *selectedCategory;

//---------------------------------------------------
//  Actions
//---------------------------------------------------
-(IBAction)cancel:(id)sender;
-(IBAction)save:(id)sender;
-(IBAction)next:(id)sender;
-(IBAction)budgetChanged:(id)sender;

@end