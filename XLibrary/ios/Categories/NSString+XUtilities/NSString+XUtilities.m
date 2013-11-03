//
//  NSString+XUtilities.m
//  XLibrary
//
//  Created by Konstantin Portnov on 04.08.13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import "NSString+XUtilities.h"

//################################################################################
@implementation NSString (XUtilities)

//################################################################################
- (NSString *) trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

//################################################################################
- (BOOL)nonEmpty
{
    return ([self trim].length > 0);
}

//################################################################################
+ (NSString *)formatLocaleDate:(NSDate *)date
{
    if (!date) return @"";
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    
    NSString * formattedDateString = [dateFormatter stringFromDate:date];
    return formattedDateString;
}

//################################################################################
- (NSString *)flattenHTML
{
    NSString * html = self;

    NSScanner *theScanner;
    NSString *text = nil;
    theScanner = [NSScanner scannerWithString:html];
    
    while ([theScanner isAtEnd] == NO) {
        
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        
        [theScanner scanUpToString:@">" intoString:&text] ;
        
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", text] withString:@""];
    }
    //
    html = [html stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return html;
}
//################################################################################
@end
//################################################################################
