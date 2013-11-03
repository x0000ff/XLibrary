//
//  UIView+XUtilities.m
//  XLibrary
//
//  Created by Konstantin Portnov on 17.10.13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import "UIView+XUtilities.h"

#import <QuartzCore/QuartzCore.h>

//################################################################################
@implementation UIView (XUtilities)

//################################################################################
- (void) applyCornerRadius:(float)radius
{
    self.layer.cornerRadius = radius;
}

//################################################################################
- (void) applyBorderWithColor:(UIColor *)color width:(float)width
{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}

//################################################################################
@end
//################################################################################
