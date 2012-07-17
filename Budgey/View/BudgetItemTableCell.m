//
// Created by jeremysaenz on 6/30/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BudgetItemTableCell.h"
#import "BGTransaction.h"


@implementation BudgetItemTableCell
@synthesize dateLabel;
@synthesize nameLabel;
@synthesize amountLabel;
@synthesize transaction;

- (void)setTransaction:(BGTransaction *)aTransaction
{
    transaction = aTransaction;

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setCurrencySymbol:@"-$"];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];

    [nameLabel setText:[aTransaction name]];
    [amountLabel setText:[formatter stringFromNumber:[aTransaction amount]]];
    [dateLabel setText:[dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[aTransaction date]]]];

}

- (id)init
{
    self = [super init];

    if (self) {
        /*UILabel *label10 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 148.0, 21.0)];
        label10.adjustsFontSizeToFitWidth = NO;
        label10.alpha = 1.000;
        label10.autoresizesSubviews = YES;
        label10.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        label10.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        label10.clearsContextBeforeDrawing = YES;
        label10.clipsToBounds = YES;
        label10.contentMode = UIViewContentModeLeft;
        label10.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        label10.enabled = YES;
        label10.frame = CGRectMake(10.0, 10.0, 148.0, 21.0);
        label10.hidden = NO;
        label10.highlightedTextColor = [UIColor colorWithWhite:1.000 alpha:1.000];
        label10.lineBreakMode = UILineBreakModeTailTruncation;
        label10.minimumFontSize = 15.000;
        label10.multipleTouchEnabled = NO;
        label10.numberOfLines = 1;
        label10.opaque = NO;
        label10.shadowOffset = CGSizeMake(0.0, -1.0);
        label10.tag = 0;
        label10.text = @"Macbook Pro";
        label10.textAlignment = UITextAlignmentLeft;
        label10.textColor = [UIColor colorWithRed:0.200 green:0.200 blue:0.200 alpha:1.000];
        label10.userInteractionEnabled = NO;

        UIResponder *responder2 = [[NSProxy alloc] init];

        UILabel *label11 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 29.0, 136.0, 21.0)];
        label11.adjustsFontSizeToFitWidth = YES;
        label11.alpha = 1.000;
        label11.autoresizesSubviews = YES;
        label11.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        label11.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        label11.clearsContextBeforeDrawing = YES;
        label11.clipsToBounds = YES;
        label11.contentMode = UIViewContentModeLeft;
        label11.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        label11.enabled = YES;
        label11.frame = CGRectMake(10.0, 29.0, 136.0, 21.0);
        label11.hidden = NO;
        label11.highlightedTextColor = [UIColor colorWithWhite:1.000 alpha:1.000];
        label11.lineBreakMode = UILineBreakModeTailTruncation;
        label11.minimumFontSize = 10.000;
        label11.multipleTouchEnabled = NO;
        label11.numberOfLines = 1;
        label11.opaque = NO;
        label11.shadowOffset = CGSizeMake(0.0, -1.0);
        label11.tag = 0;
        label11.text = @"12/12/2012";
        label11.textAlignment = UITextAlignmentLeft;
        label11.textColor = [UIColor colorWithRed:0.200 green:0.200 blue:0.200 alpha:1.000];
        label11.userInteractionEnabled = NO;

        UIView *view14 = [[UIView alloc] initWithFrame:CGRectMake(7.0, 56.0, 310.0, 1.0)];
        view14.alpha = 1.000;
        view14.autoresizesSubviews = YES;
        view14.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
        view14.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.100];
        view14.clearsContextBeforeDrawing = YES;
        view14.clipsToBounds = NO;
        view14.contentMode = UIViewContentModeBottom;
        view14.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        view14.frame = CGRectMake(7.0, 56.0, 310.0, 1.0);
        view14.hidden = NO;
        view14.multipleTouchEnabled = NO;
        view14.opaque = YES;
        view14.tag = 0;
        view14.userInteractionEnabled = YES;

        UILabel *label12 = [[UILabel alloc] initWithFrame:CGRectMake(144.0, 10.0, 128.0, 40.0)];
        label12.adjustsFontSizeToFitWidth = YES;
        label12.alpha = 1.000;
        label12.autoresizesSubviews = YES;
        label12.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        label12.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        label12.clearsContextBeforeDrawing = YES;
        label12.clipsToBounds = YES;
        label12.contentMode = UIViewContentModeLeft;
        label12.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        label12.enabled = YES;
        label12.frame = CGRectMake(144.0, 10.0, 128.0, 40.0);
        label12.hidden = NO;
        label12.highlightedTextColor = [UIColor colorWithWhite:1.000 alpha:1.000];
        label12.lineBreakMode = UILineBreakModeTailTruncation;
        label12.minimumFontSize = 10.000;
        label12.multipleTouchEnabled = NO;
        label12.numberOfLines = 1;
        label12.opaque = NO;
        label12.shadowOffset = CGSizeMake(0.0, -1.0);
        label12.tag = 0;
        label12.text = @"-$3,195.00";
        label12.textAlignment = UITextAlignmentRight;
        label12.textColor = [UIColor colorWithRed:0.608 green:0.000 blue:0.000 alpha:1.000];
        label12.userInteractionEnabled = NO;

        BudgetItemListViewController *dgetitemlistviewcontroller1 = [[NSProxy alloc] init];

        UITableViewCell *tableviewcell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BudgetItemTableCell"];
        tableviewcell2.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        tableviewcell2.alpha = 1.000;
        tableviewcell2.autoresizesSubviews = YES;
        tableviewcell2.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        tableviewcell2.backgroundColor = [UIColor colorWithWhite:0.830 alpha:1.000];
        tableviewcell2.clearsContextBeforeDrawing = YES;
        tableviewcell2.clipsToBounds = NO;
        tableviewcell2.contentMode = UIViewContentModeScaleToFill;
        tableviewcell2.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        tableviewcell2.editingAccessoryType = UITableViewCellAccessoryNone;
        tableviewcell2.frame = CGRectMake(0.0, 0.0, 320.0, 58.0);
        tableviewcell2.hidden = NO;
        tableviewcell2.indentationLevel = 0;
        tableviewcell2.indentationWidth = 10.000;
        tableviewcell2.multipleTouchEnabled = NO;
        tableviewcell2.opaque = YES;
        tableviewcell2.selectionStyle = UITableViewCellSelectionStyleBlue;
        tableviewcell2.shouldIndentWhileEditing = YES;
        tableviewcell2.showsReorderControl = NO;
        tableviewcell2.tag = 0;
        tableviewcell2.userInteractionEnabled = YES;

        [tableviewcell2 addSubview:label10];
        [tableviewcell2 addSubview:label11];
        [tableviewcell2 addSubview:label12];
        [tableviewcell2 addSubview:view14];*/
    }

    return self;
}

@end