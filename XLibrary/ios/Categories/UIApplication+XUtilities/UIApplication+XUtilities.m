//
//  UIApplication+XUtilities.m
//  XLibrary
//
//  Created by Konstantin Portnov on 20.10.13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import "UIApplication+XUtilities.h"
#import "NSString+XUtilities.h"

//################################################################################
static NSString * const kTelPrefix = @"tel://";

//################################################################################
@implementation UIApplication (XUtilities)

//################################################################################
+ (BOOL) canDialNumber:(NSString *)phoneNumber
{
    NSURL * phoneNumberUrl = [self phoneUrlFromNumber:phoneNumber];
    return ([[UIApplication sharedApplication] canOpenURL:phoneNumberUrl]);
}

//################################################################################
+ (NSURL *)phoneUrlFromNumber:(NSString *)phoneNumber
{
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if (![phoneNumber nonEmpty]) return nil;
    
    if (![phoneNumber hasPrefix:kTelPrefix])
    {
        phoneNumber = [kTelPrefix stringByAppendingString:phoneNumber];
    }
    
    NSURL * phoneNumberUrl = [NSURL URLWithString:phoneNumber];
    return phoneNumberUrl;
}

//################################################################################
+ (BOOL) dialNumber:(NSString *)phoneNumber
{
    NSURL * phoneNumberUrl = [self phoneUrlFromNumber:phoneNumber];
    if ([[UIApplication sharedApplication] canOpenURL:phoneNumberUrl])
    {
        [[UIApplication sharedApplication] openURL:phoneNumberUrl];
        return YES;
    }
    
    return NO;
}

//################################################################################
+ (BOOL) openUrlStringX:(NSString *)urlString
{
    return [self openUrlX:[NSURL URLWithString:urlString]];
}

//################################################################################
+ (BOOL) openUrlX:(NSURL *)url
{
    if (!url) return NO;
    if (![url.absoluteString nonEmpty]) return NO;
    
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        [[UIApplication sharedApplication] openURL:url];
        return YES;
    }
    
    return NO;
}

//################################################################################
@end
//################################################################################
