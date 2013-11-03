//
//  NSString+XUtilities.h
//  xLengua
//
//  Created by Konstantin Portnov on 04.08.13.
//  Copyright (c) 2013 FLC-Team. All rights reserved.
//

//################################################################################
#import <Foundation/Foundation.h>

//################################################################################
@interface NSString (XUtilities)

//################################################################################
- (NSString *) trim;
- (BOOL) nonEmpty;

//################################################################################
+ (NSString *)formatLocaleDate:(NSDate *)date;
- (NSString *)flattenHTML;

//################################################################################
@end
//################################################################################