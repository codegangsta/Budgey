//
// Created by jeremysaenz on 7/4/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BudgetFooterView.h"


@implementation BudgetFooterView

- (id)init
{
    self = [super init];

    if (self) {

        UIImageView *footerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 75.0)];
        footerImage.alpha = 1.000;
        footerImage.autoresizesSubviews = YES;
        footerImage.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        footerImage.clearsContextBeforeDrawing = YES;
        footerImage.clipsToBounds = NO;
        footerImage.contentMode = UIViewContentModeScaleToFill;
        footerImage.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        footerImage.frame = CGRectMake(0.0, 0.0, 320.0, 75.0);
        footerImage.hidden = NO;
        footerImage.highlighted = NO;
        footerImage.image = [UIImage imageNamed:@"footer.png"];
        footerImage.multipleTouchEnabled = NO;
        footerImage.opaque = YES;
        footerImage.tag = 0;
        footerImage.userInteractionEnabled = NO;

        UILabel *amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(167.0, 5.0, 133.0, 30.0)];
        amountLabel.backgroundColor = nil;
        amountLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:25];
        amountLabel.adjustsFontSizeToFitWidth = NO;
        amountLabel.alpha = 1.000;
        amountLabel.autoresizesSubviews = YES;
        amountLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        amountLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        amountLabel.clearsContextBeforeDrawing = YES;
        amountLabel.clipsToBounds = YES;
        amountLabel.contentMode = UIViewContentModeLeft;
        amountLabel.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        amountLabel.enabled = YES;
        amountLabel.frame = CGRectMake(167.0, 5.0, 133.0, 30.0);
        amountLabel.hidden = NO;
        amountLabel.lineBreakMode = UILineBreakModeTailTruncation;
        amountLabel.minimumFontSize = 10.000;
        amountLabel.multipleTouchEnabled = NO;
        amountLabel.numberOfLines = 1;
        amountLabel.opaque = NO;
        amountLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        amountLabel.tag = 0;
        amountLabel.text = @"$411.55";
        amountLabel.textAlignment = UITextAlignmentCenter;
        amountLabel.textColor = [UIColor colorWithRed:0.145 green:0.471 blue:0.000 alpha:1.000];
        amountLabel.userInteractionEnabled = NO;

        UILabel *subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(167.0, 29.0, 133.0, 21.0)];
        subtitleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15];
        subtitleLabel.backgroundColor = nil;
        subtitleLabel.adjustsFontSizeToFitWidth = NO;
        subtitleLabel.alpha = 1.000;
        subtitleLabel.autoresizesSubviews = YES;
        subtitleLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        subtitleLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        subtitleLabel.clearsContextBeforeDrawing = YES;
        subtitleLabel.clipsToBounds = YES;
        subtitleLabel.contentMode = UIViewContentModeLeft;
        subtitleLabel.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        subtitleLabel.enabled = YES;
        subtitleLabel.frame = CGRectMake(167.0, 29.0, 133.0, 21.0);
        subtitleLabel.hidden = NO;
        subtitleLabel.lineBreakMode = UILineBreakModeTailTruncation;
        subtitleLabel.minimumFontSize = 10.000;
        subtitleLabel.multipleTouchEnabled = NO;
        subtitleLabel.numberOfLines = 1;
        subtitleLabel.opaque = NO;
        subtitleLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        subtitleLabel.tag = 0;
        subtitleLabel.text = @"Left to spend.";
        subtitleLabel.textAlignment = UITextAlignmentCenter;
        subtitleLabel.textColor = [UIColor colorWithRed:0.145 green:0.471 blue:0.000 alpha:1.000];
        subtitleLabel.userInteractionEnabled = NO;

        UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [addButton setBackgroundImage:[UIImage imageNamed:@"rounded_button.png"] forState:UIControlStateNormal];
        addButton.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        addButton.adjustsImageWhenDisabled = YES;
        addButton.adjustsImageWhenHighlighted = YES;
        addButton.alpha = 1.000;
        addButton.autoresizesSubviews = YES;
        addButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        addButton.clearsContextBeforeDrawing = YES;
        addButton.clipsToBounds = NO;
        addButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        addButton.contentMode = UIViewContentModeScaleToFill;
        addButton.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        addButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        addButton.enabled = YES;
        addButton.frame = CGRectMake(20.0, 11.0, 60.0, 30.0);
        addButton.hidden = NO;
        addButton.highlighted = NO;
        addButton.multipleTouchEnabled = NO;
        addButton.opaque = NO;
        addButton.reversesTitleShadowWhenHighlighted = NO;
        addButton.selected = NO;
        addButton.showsTouchWhenHighlighted = NO;
        addButton.tag = 0;
        addButton.titleLabel.lineBreakMode = UILineBreakModeMiddleTruncation;
        addButton.titleLabel.shadowOffset = CGSizeMake(0.0, 0.0);
        addButton.userInteractionEnabled = YES;
        [addButton setTitle:@"Add" forState:UIControlStateNormal];
        [addButton setTitleColor:[UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:0.300] forState:UIControlStateNormal];
        [addButton setTitleColor:[UIColor colorWithWhite:1.000 alpha:1.000] forState:UIControlStateHighlighted];
        [addButton setTitleShadowColor:[UIColor colorWithWhite:0.500 alpha:1.000] forState:UIControlStateNormal];

        self.alpha = 1.000;
        self.autoresizesSubviews = YES;
        self.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        self.clearsContextBeforeDrawing = YES;
        self.clipsToBounds = NO;
        self.contentMode = UIViewContentModeScaleToFill;
        self.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        self.frame = CGRectMake(0.0, 0.0, 320.0, 75.0);
        self.hidden = NO;
        self.multipleTouchEnabled = NO;
        self.opaque = YES;
        self.tag = 0;
        self.userInteractionEnabled = YES;

        [self addSubview:footerImage];
        [self addSubview:amountLabel];
        [self addSubview:subtitleLabel];
        [self addSubview:addButton];
    }

    return self;
}

@end