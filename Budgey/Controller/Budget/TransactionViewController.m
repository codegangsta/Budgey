//
//  TransactionViewController.m
//  Budgey
//
//  Created by Jeremy Saenz on 6/18/12.
//  Copyright (c) 2012 Leedo Studios. All rights reserved.
//

#import "TransactionViewController.h"
#import "BGNotificationNames.h"

@implementation TransactionViewController
@synthesize saveButton, cancelButton, expenseField, amountField, categoryField, categoryPickerView, dateField, datePickerView;

- (id)init
{
    self = [super initWithNibName:@"TransactionViewController" bundle:nil];

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // skin our cancel and save buttons
    UIImage *cancelButtonImage = [[UIImage imageNamed:@"cancel-button.png"] stretchableImageWithLeftCapWidth:4 topCapHeight:0];
    [cancelButton setBackgroundImage:cancelButtonImage forState:UIControlStateNormal];
    UIImage *saveButtonImage = [[UIImage imageNamed:@"save-button.png"] stretchableImageWithLeftCapWidth:4 topCapHeight:0];
    [saveButton setBackgroundImage:saveButtonImage forState:UIControlStateNormal];

    // set the keyboard type to decimal
    amountField.keyboardType = UIKeyboardTypeDecimalPad;

    categoryPickerView = [[UIPickerView alloc] init];
    categoryPickerView.showsSelectionIndicator = YES;
    categoryPickerView.delegate = self;
    categoryPickerView.dataSource = self;
    categoryField.inputView = categoryPickerView;

    datePickerView = [[UIDatePicker alloc] init];
    datePickerView.datePickerMode = UIDatePickerModeDate;
    [datePickerView addTarget:self action:@selector(onDateSelected) forControlEvents:UIControlEventValueChanged];
    dateField.inputView = datePickerView;

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateField setText:[dateFormatter stringFromDate:[[NSDate alloc] init]]];

    // set the expense field to be the primary focus
    [expenseField becomeFirstResponder];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.saveButton = nil;
    self.cancelButton = nil;
    self.expenseField = nil;
    self.amountField = nil;
    self.categoryField = nil;
    self.categoryPickerView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


//---------------------------------------------------
//  IBActions
//---------------------------------------------------
- (IBAction)cancel:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:BGTransactionWasCanceled object:self];

    // remove our view
    [self.view removeFromSuperview];
}

- (IBAction)save:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:BGTransactionWasSaved object:self];

    // remove our view
    [self.view removeFromSuperview];
}

- (IBAction)next:(id)sender
{
    [amountField becomeFirstResponder];
}

//---------------------------------------------------
//  UIPickerViewDelegate
//---------------------------------------------------
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // handle Selection
    [categoryField setText:[NSString stringWithFormat:@"Category %d",row]];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"Category %d",row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 40;
}

//---------------------------------------------------
//  DateSelection
//---------------------------------------------------
- (void)onDateSelected
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateField setText:[dateFormatter stringFromDate:[datePickerView date]]];
}

@end
