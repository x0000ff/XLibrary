//
//  UIView+HUD.h
//  XLibrary
//
//  Created by Konstantin Portnov on 21.10.13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import "MBProgressHUD.h"

//################################################################################
static NSTimeInterval const kHudDelay_Short = 2.0;
static NSTimeInterval const kHudDelay_Medium = 3.0;
static NSTimeInterval const kHudDelay_Long = 4.0;

//################################################################################
@interface UIView (HUD)

//################################################################################
// Designed method / Main method
//################################################################################
- (MBProgressHUD *) showHudWithText:(NSString *)text detailsText:(NSString *)detailsText image:(UIImage *)image activity:(BOOL)activity;
- (MBProgressHUD *) showHudWithText:(NSString *)text detailsText:(NSString *)detailsText customView:(UIView *)customView activity:(BOOL)activity;

- (void) hideAllHudsAnimated:(BOOL)animated;
- (void) hideAllHudsAnimated:(BOOL)animated afterDelay:(NSTimeInterval)delay;

//################################################################################
- (MBProgressHUD *) showHudWithActivity:(BOOL)activity;
- (MBProgressHUD *) showHudWithText:(NSString *)text;
- (MBProgressHUD *) showHudWithText:(NSString *)text activity:(BOOL)activity;
- (MBProgressHUD *) showHudWithText:(NSString *)text image:(UIImage *)image;
- (MBProgressHUD *) showHudWithText:(NSString *)text detailsText:(NSString *)detailsText image:(UIImage *)image;

- (MBProgressHUD *) showSuccessHudWithText:(NSString *)text;
- (MBProgressHUD *) showSuccessHudWithText:(NSString *)text detailsText:(NSString *)detailsText ;

- (MBProgressHUD *) showFailHudWithText:(NSString *)text;
- (MBProgressHUD *) showFailHudWithText:(NSString *)text detailsText:(NSString *)detailsText ;

- (void) hideAllHuds;
- (void) hideAllHudsAfterDelay:(NSTimeInterval)delay;

//################################################################################
@end
//################################################################################
