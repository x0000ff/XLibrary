//
//  NSArray+JSON.m
//  XLibrary
//
//  Created by Konstantin Portnov on 27.10.13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import "NSArray+JSON.h"

//################################################################################
@implementation NSArray (JSON)

//################################################################################
+ (NSArray *) fromJsonResponse:(id)jsonResponse
{
    return [self fromJsonResponse:jsonResponse encoding:NSUTF8StringEncoding];
}

//################################################################################
+ (NSArray *) fromJsonResponse:(id)jsonResponse encoding:(NSStringEncoding)encoding
{
    if (!jsonResponse) return nil;
    NSString * jsonString = [NSString stringWithFormat:@"%@", jsonResponse];
    
    BOOL canBeConverted = [jsonString canBeConvertedToEncoding:encoding];

    if (!canBeConverted) return NO;
    NSData * jsonData = [jsonString dataUsingEncoding:encoding];
    
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
    
    NSArray * jsonArray = ([jsonObject isKindOfClass:NSArray.class]) ? (NSArray *)jsonObject : nil;
    return jsonArray;
}

//################################################################################
@end
//################################################################################
