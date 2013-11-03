//
//  UIView+XUtilities.h
//  XLibrary
//
//  Created by Konstantin Portnov on 17.10.13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import <UIKit/UIKit.h>

//################################################################################
@interface UIView (XUtilities)

//################################################################################
- (void) applyCornerRadius:(float)radius;
- (void) applyBorderWithColor:(UIColor *)color width:(float)width;

//################################################################################
@end
//################################################################################
