//
//  XIndicator.h
//  XLibrary
//
//  Created by Konstantin Portnov on 10.11.13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import <UIKit/UIKit.h>

//################################################################################
@interface XActivityIndicatorView : UIActivityIndicatorView

//################################################################################
@property (nonatomic, strong) UIImage * image;
@property (nonatomic, assign) BOOL fitFrame;
@property (nonatomic, assign) NSTimeInterval animationDuration;

//################################################################################
-(id) initWithImage:(UIImage *)image;

//################################################################################
@end
//################################################################################
