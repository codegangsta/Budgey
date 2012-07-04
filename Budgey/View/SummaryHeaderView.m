//
// Created by jeremysaenz on 7/4/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SummaryHeaderView.h"


@implementation SummaryHeaderView

- (id)init
{
    self = [super init];

    if (self) {

        self.alpha = 1.000;
        self.autoresizesSubviews = YES;
        self.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        self.clearsContextBeforeDrawing = YES;
        self.clipsToBounds = YES;
        self.contentMode = UIViewContentModeScaleToFill;
        self.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        self.frame = CGRectMake(0.0, 0.0, 320.0, 198.0);
        self.hidden = NO;
        self.multipleTouchEnabled = NO;
        self.opaque = YES;
        self.tag = 0;
        self.userInteractionEnabled = YES;

        UIView *body = [[UIView alloc] initWithFrame:CGRectMake(9.0, 57.0, 302.0, 141.0)];
        body.alpha = 1.000;
        body.autoresizesSubviews = YES;
        body.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        body.backgroundColor = [UIColor colorWithRed:0.831 green:0.831 blue:0.831 alpha:1.000];
        body.clearsContextBeforeDrawing = YES;
        body.clipsToBounds = NO;
        body.contentMode = UIViewContentModeScaleToFill;
        body.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        body.frame = CGRectMake(9.0, 57.0, 302.0, 141.0);
        body.hidden = NO;
        body.multipleTouchEnabled = NO;
        body.opaque = YES;
        body.tag = 0;
        body.userInteractionEnabled = YES;

        UIImageView *bannerView = [[UIImageView alloc] initWithFrame:CGRectMake(1.0, 27.0, 127.0, 37.0)];
        bannerView.alpha = 1.000;
        bannerView.autoresizesSubviews = YES;
        bannerView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        bannerView.clearsContextBeforeDrawing = YES;
        bannerView.clipsToBounds = NO;
        bannerView.contentMode = UIViewContentModeScaleToFill;
        bannerView.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        bannerView.frame = CGRectMake(1.0, 27.0, 127.0, 37.0);
        bannerView.hidden = NO;
        bannerView.highlighted = NO;
        bannerView.image = [UIImage imageNamed:@"banner-blue.png"];
        bannerView.multipleTouchEnabled = NO;
        bannerView.opaque = YES;
        bannerView.tag = 0;
        bannerView.userInteractionEnabled = NO;

        UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(15.0, 197.0, 290.0, 1.0)];
        separator.alpha = 0.100;
        separator.autoresizesSubviews = YES;
        separator.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        separator.backgroundColor = [UIColor colorWithWhite:0.000 alpha:1.000];
        separator.clearsContextBeforeDrawing = YES;
        separator.clipsToBounds = NO;
        separator.contentMode = UIViewContentModeScaleToFill;
        separator.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        separator.frame = CGRectMake(15.0, 197.0, 290.0, 1.0);
        separator.hidden = NO;
        separator.multipleTouchEnabled = NO;
        separator.opaque = YES;
        separator.tag = 0;
        separator.userInteractionEnabled = YES;

        UIImageView *serratedEdgeView = [[UIImageView alloc] initWithFrame:CGRectMake(-2.0, 0.0, 322.0, 57.0)];
        serratedEdgeView.alpha = 1.000;
        serratedEdgeView.autoresizesSubviews = YES;
        serratedEdgeView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        serratedEdgeView.clearsContextBeforeDrawing = YES;
        serratedEdgeView.clipsToBounds = NO;
        serratedEdgeView.contentMode = UIViewContentModeScaleToFill;
        serratedEdgeView.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        serratedEdgeView.frame = CGRectMake(-2.0, 0.0, 322.0, 57.0);
        serratedEdgeView.hidden = NO;
        serratedEdgeView.highlighted = NO;
        serratedEdgeView.image = [UIImage imageNamed:@"header-blank.png"];
        serratedEdgeView.multipleTouchEnabled = NO;
        serratedEdgeView.opaque = YES;
        serratedEdgeView.tag = 0;
        serratedEdgeView.userInteractionEnabled = NO;

        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 26.0, 103.0, 33.0)];
        titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22];
        titleLabel.backgroundColor = nil;
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
        titleLabel.text = @"Summary";
        titleLabel.textAlignment = UITextAlignmentLeft;
        titleLabel.textColor = [UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1.000];
        titleLabel.userInteractionEnabled = NO;

        UIView *separator2 = [[UIView alloc] initWithFrame:CGRectMake(15.0, 66.0, 290.0, 1.0)];
        separator2.alpha = 0.100;
        separator2.autoresizesSubviews = YES;
        separator2.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        separator2.backgroundColor = [UIColor colorWithWhite:0.000 alpha:1.000];
        separator2.clearsContextBeforeDrawing = YES;
        separator2.clipsToBounds = NO;
        separator2.contentMode = UIViewContentModeScaleToFill;
        separator2.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        separator2.frame = CGRectMake(15.0, 66.0, 290.0, 1.0);
        separator2.hidden = NO;
        separator2.multipleTouchEnabled = NO;
        separator2.opaque = YES;
        separator2.tag = 0;
        separator2.userInteractionEnabled = YES;

        UIImageView *chartView = [[UIImageView alloc] initWithFrame:CGRectMake(33.0, 67.0, 254.0, 121.0)];
        chartView.alpha = 1.000;
        chartView.autoresizesSubviews = YES;
        chartView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        chartView.clearsContextBeforeDrawing = YES;
        chartView.clipsToBounds = NO;
        chartView.contentMode = UIViewContentModeScaleToFill;
        chartView.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
        chartView.frame = CGRectMake(33.0, 67.0, 254.0, 121.0);
        chartView.hidden = NO;
        chartView.highlighted = NO;
        chartView.image = [UIImage imageNamed:@"chart-placeholder.png"];
        chartView.multipleTouchEnabled = NO;
        chartView.opaque = YES;
        chartView.tag = 0;
        chartView.userInteractionEnabled = NO;

        [self addSubview:body];
        [self addSubview:serratedEdgeView];
        [self addSubview:bannerView];
        [self addSubview:separator2];
        [self addSubview:titleLabel];
        [self addSubview:separator];
        [self addSubview:chartView];
    }

    return self;
}

@end