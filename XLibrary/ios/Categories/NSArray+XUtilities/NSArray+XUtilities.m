//
//  NSArray+XUtilities.m
//  XLibrary
//
//  Created by Konstantin Portnov on 16.10.13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import "NSArray+XUtilities.h"

//################################################################################
@implementation NSArray (XUtilities)

//################################################################################
- (id) firstObject
{
    if ([self isNonEmpty])
    {
        return [self objectAtIndex:0];
    }
    
    return nil;
}

//################################################################################
- (BOOL) isNonEmpty
{
    return (self.count > 0);
}

//################################################################################
- (id) xobjectAtIndex:(NSUInteger)index
{
    if (self.count <= 0) return nil;
    
    if (index >= self.count) return nil;
    
    return [self objectAtIndex:index];
}

//################################################################################
@end
//################################################################################
