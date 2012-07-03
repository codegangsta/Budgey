//
// Created by jeremysaenz on 6/30/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BudgetHeaderView.h"


@implementation BudgetHeaderView
@synthesize title;
@synthesize titleLabel;

- (id)init
{
    self = [super init];

    if (self) {

        // generated code!
        UILabel *spentLabel = [[UILabel alloc] initWithFrame:CGRectMake(150.0, 42.0, 54.0, 21.0)];
        spentLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
        spentLabel.adjustsFontSizeToFitWidth = YES;
        spentLabel.alpha = 1.000;
        spentLabel.autoresizesSubviews = YES;
        spentLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        spentLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        spentLabel.clearsContextBeforeDrawing = YES;
        spentLabel.clipsToBounds = YES;
        spentLabel.contentMode = UIViewContentModeLeft;
        spentLabel.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        spentLabel.enabled = YES;
        spentLabel.frame = CGRectMake(150.0, 42.0, 54.0, 21.0);
        spentLabel.hidden = NO;
        spentLabel.lineBreakMode = UILineBreakModeTailTruncation;
        spentLabel.minimumFontSize = 10.000;
        spentLabel.multipleTouchEnabled = NO;
        spentLabel.numberOfLines = 1;
        spentLabel.opaque = NO;
        spentLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        spentLabel.tag = 0;
        spentLabel.text = @"Spent";
        spentLabel.textAlignment = UITextAlignmentRight;
        spentLabel.textColor = [UIColor colorWithRed:0.200 green:0.200 blue:0.200 alpha:1.000];
        spentLabel.userInteractionEnabled = NO;
        spentLabel.backgroundColor = nil;

        UIImageView *headerBackgroundSerrated = [[UIImageView alloc] initWithFrame:CGRectMake(-2.0, 0.0, 322.0, 57.0)];
        headerBackgroundSerrated.alpha = 1.000;
        headerBackgroundSerrated.autoresizesSubviews = YES;
        headerBackgroundSerrated.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        headerBackgroundSerrated.clearsContextBeforeDrawing = YES;
        headerBackgroundSerrated.clipsToBounds = NO;
        headerBackgroundSerrated.contentMode = UIViewContentModeScaleToFill;
        headerBackgroundSerrated.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        headerBackgroundSerrated.frame = CGRectMake(-2.0, 0.0, 322.0, 57.0);
        headerBackgroundSerrated.hidden = NO;
        headerBackgroundSerrated.highlighted = NO;
        headerBackgroundSerrated.image = [UIImage imageNamed:@"header-blank.png"];
        headerBackgroundSerrated.multipleTouchEnabled = NO;
        headerBackgroundSerrated.opaque = YES;
        headerBackgroundSerrated.tag = 0;
        headerBackgroundSerrated.userInteractionEnabled = NO;

        UILabel *budgetedLabel = [[UILabel alloc] initWithFrame:CGRectMake(224.0, 42.0, 58.0, 21.0)];
        budgetedLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
        budgetedLabel.adjustsFontSizeToFitWidth = YES;
        budgetedLabel.alpha = 1.000;
        budgetedLabel.autoresizesSubviews = YES;
        budgetedLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        budgetedLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        budgetedLabel.clearsContextBeforeDrawing = YES;
        budgetedLabel.clipsToBounds = YES;
        budgetedLabel.contentMode = UIViewContentModeLeft;
        budgetedLabel.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        budgetedLabel.enabled = YES;
        budgetedLabel.frame = CGRectMake(224.0, 42.0, 58.0, 21.0);
        budgetedLabel.hidden = NO;
        budgetedLabel.lineBreakMode = UILineBreakModeTailTruncation;
        budgetedLabel.minimumFontSize = 10.000;
        budgetedLabel.multipleTouchEnabled = NO;
        budgetedLabel.numberOfLines = 1;
        budgetedLabel.opaque = NO;
        budgetedLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        budgetedLabel.tag = 0;
        budgetedLabel.text = @"Budgeted";
        budgetedLabel.textAlignment = UITextAlignmentRight;
        budgetedLabel.textColor = [UIColor colorWithRed:0.200 green:0.200 blue:0.200 alpha:1.000];
        budgetedLabel.userInteractionEnabled = NO;
        budgetedLabel.backgroundColor = nil;

        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 26.0, 103.0, 33.0)];
        titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22];
        titleLabel.adjustsFontSizeToFitWidth = YES;
        titleLabel.alpha = 1.000;
        titleLabel.autoresizesSubviews = YES;
        titleLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        titleLabel.clearsContextBeforeDrawing = YES;
        titleLabel.clipsToBounds = YES;
        titleLabel.contentMode = UIViewContentModeLeft;
        titleLabel.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        titleLabel.enabled = YES;
        titleLabel.frame = CGRectMake(20.0, 26.0, 103.0, 33.0);
        titleLabel.hidden = NO;
        titleLabel.lineBreakMode = UILineBreakModeTailTruncation;
        titleLabel.minimumFontSize = 12.000;
        titleLabel.multipleTouchEnabled = NO;
        titleLabel.numberOfLines = 1;
        titleLabel.opaque = NO;
        titleLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        titleLabel.tag = 0;
        titleLabel.text = @"Personal";
        titleLabel.textAlignment = UITextAlignmentLeft;
        titleLabel.textColor = [UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1.000];
        titleLabel.userInteractionEnabled = NO;
        titleLabel.backgroundColor = nil;

        UIImageView *blueBannerImage = [[UIImageView alloc] initWithFrame:CGRectMake(1.0, 27.0, 127.0, 37.0)];
        blueBannerImage.alpha = 1.000;
        blueBannerImage.autoresizesSubviews = YES;
        blueBannerImage.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        blueBannerImage.clearsContextBeforeDrawing = YES;
        blueBannerImage.clipsToBounds = NO;
        blueBannerImage.contentMode = UIViewContentModeScaleToFill;
        blueBannerImage.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        blueBannerImage.frame = CGRectMake(1.0, 27.0, 127.0, 37.0);
        blueBannerImage.hidden = NO;
        blueBannerImage.highlighted = NO;
        blueBannerImage.image = [UIImage imageNamed:@"banner-blue.png"];
        blueBannerImage.multipleTouchEnabled = NO;
        blueBannerImage.opaque = YES;
        blueBannerImage.tag = 0;
        blueBannerImage.userInteractionEnabled = NO;

        UIView *view9 = [[UIView alloc] initWithFrame:CGRectMake(15.0, 66.0, 290.0, 1.0)];
        view9.alpha = 0.100;
        view9.autoresizesSubviews = YES;
        view9.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        view9.backgroundColor = [UIColor colorWithWhite:0.000 alpha:1.000];
        view9.clearsContextBeforeDrawing = YES;
        view9.clipsToBounds = NO;
        view9.contentMode = UIViewContentModeScaleToFill;
        view9.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        view9.frame = CGRectMake(15.0, 66.0, 290.0, 1.0);
        view9.hidden = NO;
        view9.multipleTouchEnabled = NO;
        view9.opaque = YES;
        view9.tag = 0;
        view9.userInteractionEnabled = YES;

        UIView *view12 = [[UIView alloc] initWithFrame:CGRectMake(9.0, 57.0, 302.0, 42.0)];
        view12.alpha = 1.000;
        view12.autoresizesSubviews = YES;
        view12.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        view12.backgroundColor = [UIColor colorWithRed:0.831 green:0.831 blue:0.831 alpha:1.000];
        view12.clearsContextBeforeDrawing = YES;
        view12.clipsToBounds = NO;
        view12.contentMode = UIViewContentModeScaleToFill;
        view12.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        view12.frame = CGRectMake(9.0, 57.0, 302.0, 42.0);
        view12.hidden = NO;
        view12.multipleTouchEnabled = NO;
        view12.opaque = YES;
        view12.tag = 0;
        view12.userInteractionEnabled = YES;

        self.frame = CGRectMake(0.0, 0.0, 320.0, 67.0);
        self.alpha = 1.000;
        self.autoresizesSubviews = YES;
        self.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        self.clearsContextBeforeDrawing = YES;
        self.clipsToBounds = YES;
        self.contentMode = UIViewContentModeScaleToFill;
        self.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        self.frame = CGRectMake(0.0, 0.0, 320.0, 67.0);
        self.hidden = NO;
        self.multipleTouchEnabled = NO;
        self.opaque = YES;
        self.tag = 0;
        self.userInteractionEnabled = YES;

        [self addSubview:view12];
        [self addSubview:headerBackgroundSerrated];
        [self addSubview:blueBannerImage];
        [self addSubview:titleLabel];
        [self addSubview:spentLabel];
        [self addSubview:budgetedLabel];
        [self addSubview:view9];
    }

    return self;
}

// sets the title of the header view
- (void)setTitle:(NSString *)aTitle
{
    title = aTitle;
    [titleLabel setText:title];
}

@end