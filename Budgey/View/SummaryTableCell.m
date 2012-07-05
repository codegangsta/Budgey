//
// Created by jeremysaenz on 7/4/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SummaryTableCell.h"


@implementation SummaryTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {

        UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(150.0, 4.0, 1.0, 50.0)];
        separator.alpha = 1.000;
        separator.autoresizesSubviews = YES;
        separator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
        separator.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.100];
        separator.clearsContextBeforeDrawing = YES;
        separator.clipsToBounds = NO;
        separator.contentMode = UIViewContentModeBottom;
        separator.frame = CGRectMake(150.0, 4.0, 1.0, 50.0);
        separator.hidden = NO;
        separator.multipleTouchEnabled = NO;
        separator.opaque = YES;
        separator.tag = 0;
        separator.userInteractionEnabled = YES;

        UIView *separator2 = [[UIView alloc] initWithFrame:CGRectMake(7.0, 56.0, 286.0, 1.0)];
        separator2.alpha = 1.000;
        separator2.autoresizesSubviews = YES;
        separator2.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
        separator2.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.100];
        separator2.clearsContextBeforeDrawing = YES;
        separator2.clipsToBounds = NO;
        separator2.contentMode = UIViewContentModeBottom;
        separator2.frame = CGRectMake(15, 56.0, 270.0, 1.0);
        separator2.hidden = NO;
        separator2.multipleTouchEnabled = NO;
        separator2.opaque = YES;
        separator2.tag = 0;
        separator2.userInteractionEnabled = YES;

        UILabel *spentSubtitle = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 20.0, 151.0, 41.0)];
        spentSubtitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
        spentSubtitle.backgroundColor = nil;
        spentSubtitle.adjustsFontSizeToFitWidth = YES;
        spentSubtitle.alpha = 1.000;
        spentSubtitle.autoresizesSubviews = YES;
        spentSubtitle.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        spentSubtitle.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        spentSubtitle.clearsContextBeforeDrawing = YES;
        spentSubtitle.clipsToBounds = YES;
        spentSubtitle.contentMode = UIViewContentModeLeft;
        spentSubtitle.enabled = YES;
        spentSubtitle.frame = CGRectMake(10.0, 20.0, 151.0, 41.0);
        spentSubtitle.hidden = NO;
        spentSubtitle.highlightedTextColor = [UIColor colorWithWhite:1.000 alpha:1.000];
        spentSubtitle.lineBreakMode = UILineBreakModeTailTruncation;
        spentSubtitle.minimumFontSize = 10.000;
        spentSubtitle.multipleTouchEnabled = NO;
        spentSubtitle.numberOfLines = 1;
        spentSubtitle.opaque = NO;
        spentSubtitle.shadowOffset = CGSizeMake(0.0, -1.0);
        spentSubtitle.tag = 0;
        spentSubtitle.text = @"Spent";
        spentSubtitle.textAlignment = UITextAlignmentCenter;
        spentSubtitle.textColor = [UIColor colorWithRed:0.608 green:0.000 blue:0.000 alpha:1.000];
        spentSubtitle.userInteractionEnabled = NO;

        UILabel *spentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, -1.0, 151.0, 41.0)];
        spentLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:25];
        spentLabel.backgroundColor = nil;
        spentLabel.adjustsFontSizeToFitWidth = YES;
        spentLabel.alpha = 1.000;
        spentLabel.autoresizesSubviews = YES;
        spentLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        spentLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        spentLabel.clearsContextBeforeDrawing = YES;
        spentLabel.clipsToBounds = YES;
        spentLabel.contentMode = UIViewContentModeLeft;
        spentLabel.enabled = YES;
        spentLabel.frame = CGRectMake(10.0, -1.0, 151.0, 41.0);
        spentLabel.hidden = NO;
        spentLabel.highlightedTextColor = [UIColor colorWithWhite:1.000 alpha:1.000];
        spentLabel.lineBreakMode = UILineBreakModeTailTruncation;
        spentLabel.minimumFontSize = 10.000;
        spentLabel.multipleTouchEnabled = NO;
        spentLabel.numberOfLines = 1;
        spentLabel.opaque = NO;
        spentLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        spentLabel.tag = 0;
        spentLabel.text = @"$14,556.23";
        spentLabel.textAlignment = UITextAlignmentCenter;
        spentLabel.textColor = [UIColor colorWithRed:0.608 green:0.000 blue:0.000 alpha:1.000];
        spentLabel.userInteractionEnabled = NO;

        UILabel *incomeSubtitle = [[UILabel alloc] initWithFrame:CGRectMake(150.0, 20.0, 150.0, 41.0)];
        incomeSubtitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
        incomeSubtitle.backgroundColor = nil;
        incomeSubtitle.adjustsFontSizeToFitWidth = YES;
        incomeSubtitle.alpha = 1.000;
        incomeSubtitle.autoresizesSubviews = YES;
        incomeSubtitle.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        incomeSubtitle.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        incomeSubtitle.clearsContextBeforeDrawing = YES;
        incomeSubtitle.clipsToBounds = YES;
        incomeSubtitle.contentMode = UIViewContentModeLeft;
        incomeSubtitle.enabled = YES;
        incomeSubtitle.frame = CGRectMake(160.0, 20.0, 150.0, 41.0);
        incomeSubtitle.hidden = NO;
        incomeSubtitle.highlightedTextColor = [UIColor colorWithWhite:1.000 alpha:1.000];
        incomeSubtitle.lineBreakMode = UILineBreakModeTailTruncation;
        incomeSubtitle.minimumFontSize = 10.000;
        incomeSubtitle.multipleTouchEnabled = NO;
        incomeSubtitle.numberOfLines = 1;
        incomeSubtitle.opaque = NO;
        incomeSubtitle.shadowOffset = CGSizeMake(0.0, -1.0);
        incomeSubtitle.tag = 0;
        incomeSubtitle.text = @"Monthly Income";
        incomeSubtitle.textAlignment = UITextAlignmentCenter;
        incomeSubtitle.textColor = [UIColor colorWithRed:0.165 green:0.435 blue:0.000 alpha:1.000];
        incomeSubtitle.userInteractionEnabled = NO;

        UILabel *incomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150.0, -1.0, 150.0, 41.0)];
        incomeLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:25];
        incomeLabel.backgroundColor = nil;
        incomeLabel.adjustsFontSizeToFitWidth = YES;
        incomeLabel.alpha = 1.000;
        incomeLabel.autoresizesSubviews = YES;
        incomeLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        incomeLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        incomeLabel.clearsContextBeforeDrawing = YES;
        incomeLabel.clipsToBounds = YES;
        incomeLabel.contentMode = UIViewContentModeLeft;
        incomeLabel.enabled = YES;
        incomeLabel.frame = CGRectMake(160.0, -1.0, 150.0, 41.0);
        incomeLabel.hidden = NO;
        incomeLabel.highlightedTextColor = [UIColor colorWithWhite:1.000 alpha:1.000];
        incomeLabel.lineBreakMode = UILineBreakModeTailTruncation;
        incomeLabel.minimumFontSize = 10.000;
        incomeLabel.multipleTouchEnabled = NO;
        incomeLabel.numberOfLines = 1;
        incomeLabel.opaque = NO;
        incomeLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        incomeLabel.tag = 0;
        incomeLabel.text = @"$16,000.00";
        incomeLabel.textAlignment = UITextAlignmentCenter;
        incomeLabel.textColor = [UIColor colorWithRed:0.165 green:0.435 blue:0.000 alpha:1.000];
        incomeLabel.userInteractionEnabled = NO;

        self.accessoryType = UITableViewCellAccessoryNone;
        self.alpha = 1.000;
        self.autoresizesSubviews = YES;
        self.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        self.backgroundColor = [UIColor colorWithWhite:0.830 alpha:1.000];
        self.clearsContextBeforeDrawing = YES;
        self.clipsToBounds = NO;
        self.contentMode = UIViewContentModeScaleToFill;
        self.editingAccessoryType = UITableViewCellAccessoryNone;
        self.frame = CGRectMake(0.0, 0.0, 300.0, 58.0);
        self.hidden = NO;
        self.indentationLevel = 0;
        self.indentationWidth = 10.000;
        self.multipleTouchEnabled = NO;
        self.opaque = YES;
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
        // TODO: Find workaround for this
        //self.shouldIndentWhileEditing = YES;
        //self.showsReorderControl = NO;
        self.tag = 0;
        self.userInteractionEnabled = YES;

        [self addSubview:separator2];
        [self addSubview:separator];
        [self addSubview:spentLabel];
        [self addSubview:incomeLabel];
        [self addSubview:spentSubtitle];
        [self addSubview:incomeSubtitle];
    }

    return self;

}

@end