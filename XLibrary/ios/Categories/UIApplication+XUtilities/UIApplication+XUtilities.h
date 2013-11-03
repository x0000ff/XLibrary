//
//  UIApplication+XUtilities.h
//  Zyght
//
//  Created by Konstantin Portnov on 20.10.13.
//  Copyright (c) 2013 Digevolabs. All rights reserved.
//

//################################################################################
#import <UIKit/UIKit.h>

//################################################################################
@interface UIApplication (XUtilities)

//################################################################################
+ (BOOL) dialNumber:(NSString *)phoneNumber;
+ (BOOL) openUrlStringX:(NSString *)urlString;
+ (BOOL) openUrlX:(NSURL *)url;

//################################################################################
@end
//################################################################################
