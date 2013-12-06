//
//  UIApplication+XUtilities.h
//  XLibrary
//
//  Created by Konstantin Portnov on 20.10.13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import <UIKit/UIKit.h>

//################################################################################
@interface UIApplication (XUtilities)

//################################################################################
+ (BOOL) dialNumber:(NSString *)phoneNumber;
+ (BOOL) canDialNumber:(NSString *)phoneNumber;
+ (NSURL *)phoneUrlFromNumber:(NSString *)phoneNumber;

+ (BOOL) openUrlStringX:(NSString *)urlString;
+ (BOOL) openUrlX:(NSURL *)url;

//################################################################################
@end
//################################################################################
