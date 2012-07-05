//
// Created by jeremysaenz on 6/30/12.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "BudgetTableCell.h"
#import "BGBudgetItem.h"

@implementation BudgetTableCell

@synthesize nameLabel;
@synthesize budgetedLabel;
@synthesize spentLabel;
@synthesize budgetItem;

- (void)setBudgetItem:(BGBudgetItem *)aBudgetItem
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setCurrencySymbol:@"$"];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];

    [nameLabel setText:[aBudgetItem name]];
    [budgetedLabel setText:[formatter stringFromNumber:[aBudgetItem amount]]];
    [spentLabel setText:[formatter stringFromNumber:[aBudgetItem amountSpent]]];

    // TODO: Make text red if the spent is over the budget
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {

        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(12.0, 11.0, 102.0, 21.0)];
        nameLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:15];
        nameLabel.backgroundColor = nil;
        nameLabel.adjustsFontSizeToFitWidth = NO;
        nameLabel.alpha = 1.000;
        nameLabel.autoresizesSubviews = YES;
        nameLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        nameLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        nameLabel.clearsContextBeforeDrawing = YES;
        nameLabel.clipsToBounds = YES;
        nameLabel.contentMode = UIViewContentModeLeft;
        nameLabel.enabled = YES;
        nameLabel.frame = CGRectMake(12.0, 11.0, 102.0, 21.0);
        nameLabel.hidden = NO;
        nameLabel.highlightedTextColor = [UIColor colorWithWhite:1.000 alpha:1.000];
        nameLabel.lineBreakMode = UILineBreakModeTailTruncation;
        nameLabel.minimumFontSize = 10.000;
        nameLabel.multipleTouchEnabled = NO;
        nameLabel.numberOfLines = 1;
        nameLabel.opaque = NO;
        nameLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        nameLabel.tag = 0;
        nameLabel.text = @"Business";
        nameLabel.textAlignment = UITextAlignmentLeft;
        nameLabel.textColor = [UIColor colorWithRed:0.200 green:0.200 blue:0.200 alpha:1.000];
        nameLabel.userInteractionEnabled = NO;

        UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(7.0, 43.0, 310.0, 1.0)];
        separator.alpha = 1.000;
        separator.autoresizesSubviews = YES;
        separator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
        separator.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.100];
        separator.clearsContextBeforeDrawing = YES;
        separator.clipsToBounds = NO;
        separator.contentMode = UIViewContentModeBottom;
        separator.frame = CGRectMake(7.0, 43.0, 330.0, 1.0);
        separator.hidden = NO;
        separator.multipleTouchEnabled = NO;
        separator.opaque = YES;
        separator.tag = 0;
        separator.userInteractionEnabled = YES;

        spentLabel = [[UILabel alloc] initWithFrame:CGRectMake(141.0, 11.0, 67.0, 21.0)];
        spentLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
        spentLabel.backgroundColor = nil;
        spentLabel.adjustsFontSizeToFitWidth = YES;
        spentLabel.alpha = 1.000;
        spentLabel.autoresizesSubviews = YES;
        spentLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        spentLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        spentLabel.clearsContextBeforeDrawing = YES;
        spentLabel.clipsToBounds = YES;
        spentLabel.contentMode = UIViewContentModeLeft;
        spentLabel.enabled = YES;
        spentLabel.frame = CGRectMake(155.0, 11.0, 67.0, 21.0);
        spentLabel.hidden = NO;
        spentLabel.highlightedTextColor = [UIColor colorWithWhite:1.000 alpha:1.000];
        spentLabel.lineBreakMode = UILineBreakModeTailTruncation;
        spentLabel.minimumFontSize = 10.000;
        spentLabel.multipleTouchEnabled = NO;
        spentLabel.numberOfLines = 1;
        spentLabel.opaque = NO;
        spentLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        spentLabel.tag = 0;
        spentLabel.text = @"$463.71";
        spentLabel.textAlignment = UITextAlignmentRight;
        spentLabel.textColor = [UIColor colorWithRed:0.200 green:0.200 blue:0.200 alpha:1.000];
        spentLabel.userInteractionEnabled = NO;

        budgetedLabel = [[UILabel alloc] initWithFrame:CGRectMake(225.0, 11.0, 67.0, 21.0)];
        budgetedLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
        budgetedLabel.backgroundColor = nil;
        budgetedLabel.adjustsFontSizeToFitWidth = YES;
        budgetedLabel.alpha = 1.000;
        budgetedLabel.autoresizesSubviews = YES;
        budgetedLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        budgetedLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        budgetedLabel.clearsContextBeforeDrawing = YES;
        budgetedLabel.clipsToBounds = YES;
        budgetedLabel.contentMode = UIViewContentModeLeft;
        budgetedLabel.enabled = YES;
        budgetedLabel.frame = CGRectMake(243.0, 11.0, 67.0, 21.0);
        budgetedLabel.hidden = NO;
        budgetedLabel.highlightedTextColor = [UIColor colorWithWhite:1.000 alpha:1.000];
        budgetedLabel.lineBreakMode = UILineBreakModeTailTruncation;
        budgetedLabel.minimumFontSize = 10.000;
        budgetedLabel.multipleTouchEnabled = NO;
        budgetedLabel.numberOfLines = 1;
        budgetedLabel.opaque = NO;
        budgetedLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        budgetedLabel.tag = 0;
        budgetedLabel.text = @"$600.00";
        budgetedLabel.textAlignment = UITextAlignmentRight;
        budgetedLabel.textColor = [UIColor colorWithRed:0.200 green:0.200 blue:0.200 alpha:1.000];
        budgetedLabel.userInteractionEnabled = NO;

        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.alpha = 1.000;
        self.autoresizesSubviews = YES;
        self.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        self.backgroundColor = [UIColor colorWithWhite:0.830 alpha:1.000];
        self.clearsContextBeforeDrawing = YES;
        self.clipsToBounds = NO;
        self.contentMode = UIViewContentModeScaleToFill;
        self.editingAccessoryType = UITableViewCellAccessoryNone;
        self.frame = CGRectMake(0.0, 0.0, 320.0, 44.0);
        self.hidden = NO;
        self.indentationLevel = 0;
        self.indentationWidth = 10.000;
        self.multipleTouchEnabled = NO;
        self.opaque = YES;
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
        // TODO: Make workaround for this
        //self.shouldIndentWhileEditing = YES;
        //self.showsReorderControl = NO;
        self.tag = 0;
        self.userInteractionEnabled = YES;

        [self.contentView addSubview:separator];
        [self.contentView addSubview:budgetedLabel];
        [self.contentView addSubview:spentLabel];
        [self.contentView addSubview:nameLabel];

        self.contentView.clipsToBounds = NO;
    }

    return self;
}

@end