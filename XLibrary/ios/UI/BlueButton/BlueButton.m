//
//  BlueButton.m
//  TuInfoBolivia
//
//  Created by Konstantin Portnov on 17.10.13.
//  Copyright (c) 2013 Digevolabs. All rights reserved.
//

//################################################################################
#import "BlueButton.h"
#import "UIImage+XUtilities.h"
#import "UIView+XUtilities.h"
#import "UIColorFromPhotoshop.h"

//################################################################################
@implementation BlueButton

//################################################################################
static float const kFontSize = 18;

//################################################################################
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

//################################################################################
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [self setup];
    }
    return self;
}

//################################################################################
- (id)init
{
    self = [super init];
    if(self)
    {
        [self setup];
    }
    return self;
}

//################################################################################
+ (UIFont *) titleFont
{
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:kFontSize];
}

//################################################################################
- (void) setup
{
    self.clipsToBounds = YES;
    [self applyCornerRadius:4];
    
    self.backgroundColor = [UIColor orangeColor];
    self.titleLabel.font = [self.class titleFont];
    
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIColor * xBlue = UIColorFromHexValue(0x3D55A8);
    UIColor * xBluePressed = UIColorFromHexValue(0x6589C3);

    [self setBackgroundImage:[UIImage imageWithColor:xBlue] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageWithColor:xBluePressed] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[UIImage imageWithColor:[UIColor lightGrayColor]] forState:UIControlStateDisabled];
}

//################################################################################
@end
//################################################################################
