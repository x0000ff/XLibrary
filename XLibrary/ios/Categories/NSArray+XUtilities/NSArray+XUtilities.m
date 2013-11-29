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
- (NSArray *)reversedArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) {
        [array addObject:element];
    }
    return array;
}
//################################################################################
@end
//################################################################################
