//
//  CreateBudgetViewController.m
//  Budgey
//
//  Created by Jeremy Saenz on 6/29/12.
//  Copyright (c) 2012 Leedo Studios. All rights reserved.
//

#import "CreateBudgetViewController.h"
#import "BGBudgetManager.h"

@implementation CreateBudgetViewController
{
    UIDatePicker *datePickerView;
}

@synthesize saveButton;
@synthesize cancelButton;
@synthesize monthField;
@synthesize nameField;
@synthesize templateField;
@synthesize selectedDate;


- (id)init
{
    self = [self initWithNibName:@"CreateBudgetViewController" bundle:nil];

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

    datePickerView = [[UIDatePicker alloc] init];
    datePickerView.datePickerMode = UIDatePickerModeDate;
    [datePickerView addTarget:self action:@selector(onDateSelected) forControlEvents:UIControlEventValueChanged];
    monthField.inputView = datePickerView;

    [self setSelectedDate:[[NSDate alloc] init]];

    // focus on the month field
    [monthField becomeFirstResponder];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

//---------------------------------------------------
//  IBActions
//---------------------------------------------------
- (IBAction)cancel:(id)sender
{
    // remove our view
    [self.view removeFromSuperview];
}

- (IBAction)save:(id)sender
{
    // Create a new budget
    [[BGBudgetManager sharedManager] createBudgetFromDefaultTemplate:[nameField text] andDate:selectedDate];

    // remove our view
    [self.view removeFromSuperview];
}

- (void)onDateSelected
{
    [self setSelectedDate:[datePickerView date]];
}

- (void)setSelectedDate:(NSDate *)aSelectedDate
{
    selectedDate = aSelectedDate;

    // change the text of the nickname to "<Month> Budget"
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMMM"];

    [nameField setText:[NSString stringWithFormat:@"%@ Budget",[formatter stringFromDate:aSelectedDate]]];

    [formatter setDateFormat:@"MMMM YYYY"];
    [monthField setText:[formatter stringFromDate:aSelectedDate]];
}


@end
