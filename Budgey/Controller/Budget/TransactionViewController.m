//
//  TransactionViewController.m
//  Budgey
//
//  Created by Jeremy Saenz on 6/18/12.
//  Copyright (c) 2012 Leedo Studios. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import "TransactionViewController.h"
#import "BGNotificationNames.h"
#import "BGBudgetManager.h"
#import "BGCategory.h"
#import "BGBudget.h"
#import "BGBudgetItem.h"
#import "BGTransactionManager.h"
#import "BGTransaction.h"

@implementation TransactionViewController
{
    //---------------------------------------------------
    //  Flags
    //---------------------------------------------------
    BOOL isModal;

    //---------------------------------------------------
    //  Data
    //---------------------------------------------------
    BGTransaction *data;
    BGBudgetManager *budgetManager;

    //---------------------------------------------------
    //  Picker View
    //---------------------------------------------------
    BGCategory *selectedCategory;
    NSArray *categories;
}
@synthesize saveButton, cancelButton, expenseField, amountField,
categoryField, categoryPickerView, dateField, datePickerView,
backgroundView, cardView, dateLineView;

- (id)init
{
    self = [super initWithNibName:@"TransactionViewController" bundle:nil];

    budgetManager = [BGBudgetManager sharedManager];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    categories = [[budgetManager.selectedBudget categories] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    selectedCategory = [categories objectAtIndex:0];

    return self;
}

// TODO: Implement an initWithMode: message instead
- (id)initWithModal
{
    self = [self init];
    isModal = YES;

    return self;
}

- (id)initWithData:(BGTransaction *)aData
{
    self = [self init];

    data = aData;

    return self;;
}


- (void)viewDidLoad
{
    [self.navigationItem setTitle:@"Edit"];

    [super viewDidLoad];

    // skin our cancel and save buttons
    UIImage *cancelButtonImage = [[UIImage imageNamed:@"cancel-button.png"] stretchableImageWithLeftCapWidth:4 topCapHeight:0];
    [cancelButton setBackgroundImage:cancelButtonImage forState:UIControlStateNormal];
    UIImage *saveButtonImage = [[UIImage imageNamed:@"save-button.png"] stretchableImageWithLeftCapWidth:4 topCapHeight:0];
    [saveButton setBackgroundImage:saveButtonImage forState:UIControlStateNormal];

    if (!isModal) {
        backgroundView.backgroundColor = [UIColor clearColor];

        // size the card to fit in with a navigation bar
        CGRect frame = cardView.frame;
        //frame = CGRectOffset(cardView.frame, 0, -22);
        frame.size.height = 170;
        [cardView setFrame:frame];

        // hide bottom buttons
        [saveButton setHidden:YES];
        [cancelButton setHidden:YES];
        [dateLineView setHidden:YES];
    }

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

    // set any data if we have it
    if (data != nil)
    {
        [expenseField setText:[data name]];
        [amountField setText:[[data amount] stringValue]];
        [self selectBudgetItem:[data budgetItem]];
        [dateField setText:[dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[data date]]]];
    }

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

- (void)viewWillDisappear:(BOOL)animated
{
    // save out if we initialized with data
    if (data != nil)
    {
        data.amount = [NSDecimalNumber decimalNumberWithString:[amountField text]];
        data.date = [[datePickerView date] timeIntervalSince1970];
        data.name = [expenseField text];
        data.budgetItem = [self budgetItemFromIndex:[categoryPickerView selectedRowInComponent:1]];
        [[BGTransactionManager sharedManager] updateTransaction:data];

        data = nil;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BGBudgetItem *)budgetItemFromIndex:(NSInteger)index
{
    BGCategory *category = selectedCategory;
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *budgetItems = [[category budgetItems] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    BGBudgetItem *budgetItem = [budgetItems objectAtIndex:index];
    return budgetItem;
}

- (void)selectBudgetItem:(BGBudgetItem *)budgetItem
{
    selectedCategory = [budgetItem category];
    [categoryField setText:[NSString stringWithFormat:@"%@: %@",data.budgetItem.category.name,data.budgetItem.name]];

    BGCategory *category = selectedCategory;
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *budgetItems = [[category budgetItems] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    [categoryPickerView selectRow:[budgetItems indexOfObject:budgetItem] inComponent:1 animated:YES];
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
    // our big fat save transaction call
    [[BGTransactionManager sharedManager] createTransactionWithName:[expenseField text] andDate:[datePickerView date] andAmount:[NSDecimalNumber decimalNumberWithString:[amountField text]] forBudgetItem:[self budgetItemFromIndex:[categoryPickerView selectedRowInComponent:1]]];
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
    if (component == 0) // categories
    {
        selectedCategory = [categories objectAtIndex:row];
        [pickerView reloadComponent:1];
    }

    BGBudgetItem *budgetItem = [self budgetItemFromIndex:[pickerView selectedRowInComponent:1]];
    [categoryField setText:[NSString stringWithFormat:@"%@: %@",[selectedCategory name],[budgetItem name]]];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) // categories
    {
        return [[categories objectAtIndex:row] name];
    }
    else // budget Items
    {
        return [[self budgetItemFromIndex:row] name];
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) // Categories
    {
        return [budgetManager.selectedBudget.categories count];
    }
    else // budget items
    {
        return [selectedCategory.budgetItems count];
    }
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
