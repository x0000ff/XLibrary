//
//  NSArray+XUtilities.h
//  Zyght
//
//  Created by Konstantin Portnov on 16.10.13.
//  Copyright (c) 2013 Digevolabs. All rights reserved.
//

//################################################################################
#import <Foundation/Foundation.h>

//################################################################################
@interface NSArray (XUtilities)

//################################################################################
- (id)   firstObject;
- (BOOL) isNonEmpty;
- (id) xobjectAtIndex:(NSUInteger)index;

//################################################################################
@end
//################################################################################
