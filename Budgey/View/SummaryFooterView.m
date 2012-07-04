//
// Created by jeremysaenz on 7/4/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SummaryFooterView.h"


@implementation SummaryFooterView

- (id)init
{
    self = [super init];

    if (self) {

        UIImageView *footerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, -14.0, 320.0, 76.0)];
        footerImageView.alpha = 1.000;
        footerImageView.autoresizesSubviews = YES;
        footerImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        footerImageView.clearsContextBeforeDrawing = YES;
        footerImageView.clipsToBounds = NO;
        footerImageView.contentMode = UIViewContentModeScaleToFill;
        footerImageView.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        footerImageView.frame = CGRectMake(0.0, -14.0, 320.0, 76.0);
        footerImageView.hidden = NO;
        footerImageView.highlighted = NO;
        footerImageView.image = [UIImage imageNamed:@"footer.png"];
        footerImageView.multipleTouchEnabled = NO;
        footerImageView.opaque = YES;
        footerImageView.tag = 0;
        footerImageView.userInteractionEnabled = NO;

        UILabel *remainingLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 9.0, 280.0, 21.0)];
        remainingLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:15];
        remainingLabel.backgroundColor = nil;
        remainingLabel.adjustsFontSizeToFitWidth = YES;
        remainingLabel.alpha = 1.000;
        remainingLabel.autoresizesSubviews = YES;
        remainingLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        remainingLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        remainingLabel.clearsContextBeforeDrawing = YES;
        remainingLabel.clipsToBounds = YES;
        remainingLabel.contentMode = UIViewContentModeLeft;
        remainingLabel.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        remainingLabel.enabled = YES;
        remainingLabel.frame = CGRectMake(20.0, 9.0, 280.0, 21.0);
        remainingLabel.hidden = NO;
        remainingLabel.lineBreakMode = UILineBreakModeTailTruncation;
        remainingLabel.minimumFontSize = 10.000;
        remainingLabel.multipleTouchEnabled = NO;
        remainingLabel.numberOfLines = 1;
        remainingLabel.opaque = NO;
        remainingLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        remainingLabel.tag = 0;
        remainingLabel.text = @"$0.00 Remaining to Budget!";
        remainingLabel.textAlignment = UITextAlignmentCenter;
        remainingLabel.textColor = [UIColor colorWithRed:0.165 green:0.435 blue:0.000 alpha:1.000];
        remainingLabel.userInteractionEnabled = NO;

        self.alpha = 1.000;
        self.autoresizesSubviews = YES;
        self.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        self.clearsContextBeforeDrawing = YES;
        self.clipsToBounds = YES;
        self.contentMode = UIViewContentModeScaleToFill;
        self.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        self.frame = CGRectMake(0.0, 0.0, 320.0, 62.0);
        self.hidden = NO;
        self.multipleTouchEnabled = NO;
        self.opaque = YES;
        self.tag = 0;
        self.userInteractionEnabled = YES;

        [self addSubview:footerImageView];
        [self addSubview:remainingLabel];
    }

    return self;
}

@end