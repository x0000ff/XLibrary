//
//  LoadingButton.h
//  XLibrary
//
//  Created by Konstantin Portnov on 27.10.13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import <UIKit/UIKit.h>

//################################################################################
@interface LoadingButton : UIButton

//################################################################################
- (void) showLoaderWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style;
- (void) showLoader;
- (void) hideLoader;

//################################################################################
@end
//################################################################################
