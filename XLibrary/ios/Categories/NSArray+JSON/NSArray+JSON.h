//
//  NSArray+JSON.h
//  XLibrary
//
//  Created by Konstantin Portnov on 27.10.13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import <Foundation/Foundation.h>

//################################################################################
@interface NSArray (JSON)

//################################################################################
+ (NSArray *) fromJsonResponse:(id)jsonResponse;
+ (NSArray *) fromJsonResponse:(id)jsonResponse encoding:(NSStringEncoding)encoding;

//################################################################################
@end
//################################################################################
