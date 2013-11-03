//
//  UIView+Hierarchy.m
//  Vanish
//
//  Created by Konstantin Portnov on 27.10.13.
//  Copyright (c) 2013 Nico Arqueros. All rights reserved.
//

//################################################################################
#import "UIView+Hierarchy.h"

//################################################################################
@implementation UIView (Hierarchy)

//################################################################################
- (id) subViewForClass:(Class)viewClass
{
    for (UIView *subview in self.subviews)
    {
        if ([subview isKindOfClass:viewClass])
        {
            return (UIActivityIndicatorView *)subview;
        }
        
        [subview subViewForClass:viewClass];
    }
    
    return nil;
}

//################################################################################
@end
//################################################################################
