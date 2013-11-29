//
//  NSArray+XUtilities.h
//  XLibrary
//
//  Created by Konstantin Portnov on 16.10.13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import <Foundation/Foundation.h>

//################################################################################
@interface NSArray (XUtilities)

//################################################################################
- (id)   firstObject;
- (BOOL) isNonEmpty;
- (id) xobjectAtIndex:(NSUInteger)index;
- (NSArray *)reversedArray;

//################################################################################
@end
//################################################################################
