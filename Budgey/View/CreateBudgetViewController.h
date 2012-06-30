//
//  CreateBudgetViewController.h
//  Budgey
//
//  Created by Jeremy Saenz on 6/29/12.
//  Copyright (c) 2012 Leedo Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateBudgetViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *saveButton;
@property (nonatomic, strong) IBOutlet UIButton *cancelButton;
@property (nonatomic, strong) IBOutlet UITextField *monthField;
@property (nonatomic, strong) IBOutlet UITextField *nameField;
@property (nonatomic, strong) IBOutlet UITextField *templateField;
@property (nonatomic, strong) NSDate *selectedDate;

-(IBAction)cancel:(id)sender;
-(IBAction)save:(id)sender;

@end
