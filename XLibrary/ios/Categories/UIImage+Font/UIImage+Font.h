//
//  UIImage+Font.h
//  XLibrary
//
//  Created by Konstantin Portnov on 11/9/13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import <UIKit/UIKit.h>

//################################################################################
@interface UIImage (Font)

+ (UIImage *)imageWithIcon:(NSString *)fa_icon
                     size:(CGFloat)size
                    color:(UIColor *)color
                     font:(UIFont *)font;

+ (UIImage *)imageWithIcon:(NSString *)fa_icon
                 iconColor:(UIColor *)iconColor
                  iconSize:(CGFloat)iconSize
                 imageSize:(CGSize)imageSize
                      font:(UIFont *)font;

//################################################################################
@end
//################################################################################
