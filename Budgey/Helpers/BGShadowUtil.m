//
// Created by jeremysaenz on 6/21/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BGShadowUtil.h"
#import "QuartzCore/CALayer.h"


@implementation BGShadowUtil

+ (void)applyShadowToView:(CALayer *)layer
{
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOpacity = 0.5;
    layer.shadowRadius = 5;
    layer.shadowOffset = CGSizeMake(3.0f, 3.0f);
}

@end