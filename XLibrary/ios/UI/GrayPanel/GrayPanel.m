//
//  GrayPanel.m
//  TuInfoBolivia
//
//  Created by Konstantin Portnov on 17.10.13.
//  Copyright (c) 2013 Digevolabs. All rights reserved.
//

//################################################################################
#import "GrayPanel.h"
#import "UIImage+XUtilities.h"
#import "UIView+XUtilities.h"

//################################################################################
@implementation GrayPanel

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
- (void) setup
{
    self.clipsToBounds = YES;
    [self applyCornerRadius:4];
    
    UIColor * xGray = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1];
    
    self.backgroundColor = xGray;
}

//################################################################################
@end
//################################################################################
