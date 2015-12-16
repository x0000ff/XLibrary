//
//  NSDictionary+JSON.m
//  XLibrary
//
//  Created by Konstantin Portnov on 27.10.13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import "NSDictionary+JSON.h"

//################################################################################
@implementation NSDictionary (JSON)

//################################################################################
+ (NSDictionary *) fromJsonResponse:(id)jsonResponse
{
    return [self fromJsonResponse:jsonResponse encoding:NSUTF8StringEncoding];
}

//################################################################################
+ (NSDictionary *) fromJsonResponse:(id)jsonResponse encoding:(NSStringEncoding)encoding
{
    if (!jsonResponse) return nil;
    NSString * jsonString = [NSString stringWithFormat:@"%@", jsonResponse];
    
    BOOL canBeConverted = [jsonString canBeConvertedToEncoding:encoding];
    
    if (!canBeConverted) return nil;
    NSData * jsonData = [jsonString dataUsingEncoding:encoding];
    
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
    
    NSDictionary * jsonArray = ([jsonObject isKindOfClass:NSDictionary.class]) ? (NSDictionary *)jsonObject : nil;
    return jsonArray;
}

//################################################################################
@end
//################################################################################
