//
// Created by jeremysaenz on 7/18/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CreateBudgetItemViewController.h"
#import "BGBudgetManager.h"
#import "BGBudget.h"
#import "BGCategory.h"


@implementation CreateBudgetItemViewController
{
    NSDecimalNumber *leftToBudget;
    UIPickerView *categoryPickerView;
    BGBudgetManager *budgetManager;
    NSArray *categories;
}

@synthesize saveButton;
@synthesize cancelButton;
@synthesize nameField;
@synthesize budgetField;
@synthesize categoryField;
@synthesize leftToBudgetLabel;
@synthesize selectedCategory;


- (id)init
{
    self = [super initWithNibName:@"CreateBudgetItemViewController" bundle:nil];

    if (self) {
        budgetManager = [BGBudgetManager sharedManager];
        leftToBudget = [NSDecimalNumber decimalNumberWithString:@"500.00"];
        selectedCategory = nil;
    }

    return self;
}

- (void)viewDidLoad
{
    // load up our categories for the selected budget
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    categories = [[budgetManager.selectedBudget categories] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    if (!selectedCategory)
        [self setSelectedCategory:selectedCategory = [categories objectAtIndex:0]];

    // skin our cancel and save buttons
    UIImage *cancelButtonImage = [[UIImage imageNamed:@"cancel-button.png"] stretchableImageWithLeftCapWidth:4 topCapHeight:0];
    [cancelButton setBackgroundImage:cancelButtonImage forState:UIControlStateNormal];
    UIImage *saveButtonImage = [[UIImage imageNamed:@"save-button.png"] stretchableImageWithLeftCapWidth:4 topCapHeight:0];
    [saveButton setBackgroundImage:saveButtonImage forState:UIControlStateNormal];

    categoryPickerView = [[UIPickerView alloc] init];
    categoryPickerView.showsSelectionIndicator = YES;
    categoryPickerView.delegate = self;
    categoryPickerView.dataSource = self;
    categoryField.inputView = categoryPickerView;
    [categoryPickerView selectRow:[categories indexOfObject:selectedCategory] inComponent:0 animated:NO];

    // set the keyboard type for entering in dollar amounts
    budgetField.keyboardType = UIKeyboardTypeDecimalPad;

    // make first responder
    [nameField becomeFirstResponder];
}

- (void)setSelectedCategory:(BGCategory *)aSelectedCategory
{
    selectedCategory = aSelectedCategory;
    categoryField.text = selectedCategory.name;

    [categoryPickerView selectRow:[categories indexOfObject:aSelectedCategory] inComponent:0 animated:NO];
}

//---------------------------------------------------
//  IBActions
//---------------------------------------------------
- (IBAction)cancel:(id)sender
{
    [self.view removeFromSuperview];
}

- (IBAction)save:(id)sender
{
    [self.view removeFromSuperview];
}

- (IBAction)next:(id)sender
{
    [budgetField becomeFirstResponder];
}

- (IBAction)budgetChanged:(id)sender
{
    // change the text
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setCurrencySymbol:@"$"];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSDecimalNumber *budgeted = [NSDecimalNumber decimalNumberWithString:[budgetField text]];
    NSNumber *amount = [NSNumber numberWithFloat:[leftToBudget floatValue] - (isnan([budgeted floatValue]) ? 0 : [budgeted floatValue])];
    NSString *formattedAmount = [formatter stringFromNumber:amount];

    if ([amount floatValue] > 0)
    {
        [leftToBudgetLabel setText:[NSString stringWithFormat:@"%@ left to budget",formattedAmount]];
    }
    else
    {
        [leftToBudgetLabel setText:[NSString stringWithFormat:@"%@ over budget!",formattedAmount]];
    }

    [leftToBudgetLabel setHidden:[amount isEqualToNumber:[NSNumber numberWithInt:0]] || isnan([amount floatValue])];
}

//---------------------------------------------------
//  UIPicker Delegate
//---------------------------------------------------
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return categories.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[categories objectAtIndex:row] name];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self setSelectedCategory:[categories objectAtIndex:row]];
}

@end