//
//  TransactionViewController.h
//  Budgey
//
//  Created by Jeremy Saenz on 6/18/12.
//  Copyright (c) 2012 Leedo Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransactionViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIButton *saveButton;
    UIButton *cancelButton;
    UITextField *expenseField;
    UITextField *amountField;
    UITextField *categoryField;
    UIPickerView *categoryPickerView;
    UITextField *dateField;
    UIDatePicker *datePickerView;
}

@property (nonatomic, strong) IBOutlet UIButton *saveButton;
@property (nonatomic, strong) IBOutlet UIButton *cancelButton;
@property (nonatomic, strong) IBOutlet UITextField *expenseField;
@property (nonatomic, strong) IBOutlet UITextField *amountField;
@property (nonatomic, strong) IBOutlet UITextField *categoryField;
@property (nonatomic, strong) UIPickerView *categoryPickerView;
@property (nonatomic, strong) IBOutlet UITextField *dateField;
@property (nonatomic, strong) UIDatePicker *datePickerView;

-(IBAction)cancel:(id)sender;
-(IBAction)save:(id)sender;

-(IBAction)next:(id)sender;

@end
