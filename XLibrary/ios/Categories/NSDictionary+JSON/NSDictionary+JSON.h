//
//  NSDictionary+JSON.h
//  XLibrary
//
//  Created by Konstantin Portnov on 27.10.13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import <Foundation/Foundation.h>

//################################################################################
@interface NSDictionary (JSON)

//################################################################################
+ (NSDictionary *) fromJsonResponse:(id)jsonResponse;
+ (NSDictionary *) fromJsonResponse:(id)jsonResponse encoding:(NSStringEncoding)encoding;

//################################################################################
@end
//################################################################################
