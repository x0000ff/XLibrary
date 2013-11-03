//
//  UIView+HUD.m
//  XLibrary
//
//  Created by Konstantin Portnov on 21.10.13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import "UIView+HUD.h"

//################################################################################
@implementation UIView (HUD)

//################################################################################
static NSString * const kSuccessIconImageName = @"xic-success";
static NSString * const kFailIconImageName = @"xic-error";

//################################################################################
- (void) hideAllHuds
{
    [self hideAllHudsAnimated:YES];
}

//################################################################################
- (void) hideAllHudsAnimated:(BOOL)animated
{
    [MBProgressHUD hideAllHUDsForView:self animated:animated];
}

//################################################################################
- (void) hideAllHudsAfterDelay:(NSTimeInterval)delay
{
    [self hideAllHudsAnimated:YES afterDelay:delay];
}

//################################################################################
- (void) hideAllHudsAnimated:(BOOL)animated afterDelay:(NSTimeInterval)delay
{
    NSArray * huds = [MBProgressHUD allHUDsForView:self];
    for (MBProgressHUD * hud in huds)
    {
        [hud hide:animated afterDelay:delay];
    }
}

//################################################################################
- (MBProgressHUD *) showHudWithActivity:(BOOL)activity
{
    return [self showHudWithText:nil detailsText:nil image:nil activity:activity];
}

//################################################################################
- (MBProgressHUD *) showHudWithText:(NSString *)text activity:(BOOL)activity
{
    return [self showHudWithText:text detailsText:nil image:nil activity:activity];
}

//################################################################################
- (MBProgressHUD *) showHudWithText:(NSString *)text
{
    return [self showHudWithText:text detailsText:nil image:nil activity:NO];
}

//################################################################################
- (MBProgressHUD *) showHudWithText:(NSString *)text image:(UIImage *)image
{
    return [self showHudWithText:text detailsText:nil image:image activity:NO];
}

//################################################################################
- (MBProgressHUD *) showHudWithText:(NSString *)text detailsText:(NSString *)detailsText image:(UIImage *)image
{
    return [self showHudWithText:text detailsText:detailsText image:image activity:NO];
}

//################################################################################
- (MBProgressHUD *) showSuccessHudWithText:(NSString *)text
{
    return [self showSuccessHudWithText:text detailsText:nil];
}
//################################################################################
- (MBProgressHUD *) showSuccessHudWithText:(NSString *)text detailsText:(NSString *)detailsText
{
    return [self showHudWithText:text detailsText:detailsText image:[UIImage imageNamed:kSuccessIconImageName]];
}

//################################################################################
- (MBProgressHUD *) showFailHudWithText:(NSString *)text
{
    return [self showFailHudWithText:text detailsText:nil];
}

//################################################################################
- (MBProgressHUD *) showFailHudWithText:(NSString *)text detailsText:(NSString *)detailsText
{
    return [self showHudWithText:text detailsText:detailsText image:[UIImage imageNamed:kFailIconImageName]];
}

//################################################################################
- (MBProgressHUD *) showHudWithText:(NSString *)text detailsText:(NSString *)detailsText image:(UIImage *)image activity:(BOOL)activity
{
//    [self hideAllHudsAnimated:YES];
    
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
	hud.animationType = MBProgressHUDAnimationZoom;
    hud.labelText = text;
    hud.detailsLabelText = detailsText;
    
    if (image)
    {
        hud.customView = [[UIImageView alloc] initWithImage:image];
        hud.mode = MBProgressHUDModeCustomView;
    }
    else
    {
        hud.mode = activity ? MBProgressHUDModeIndeterminate : MBProgressHUDModeText;
    }
    hud.removeFromSuperViewOnHide = YES;
    
    return hud;
}

//################################################################################
@end
//################################################################################
