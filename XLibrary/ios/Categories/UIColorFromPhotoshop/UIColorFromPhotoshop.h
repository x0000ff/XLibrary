//
//  UIColorFromPhotoshop.h
//  XLibrary
//
//  Created by Konstantin Portnov on 20.10.13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import <Foundation/Foundation.h>

//################################################################################
//In header
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/* usage
UIColor *color = UIColorFromRGB(0x000000)

//you can also use it inline
[text.textField setTextColor:UIColorFromRGB(0xcccccc)];
*/

//################################################################################
#define PhotoshopColorValue(x) (x / 255.0)

//################################################################################
#define UIColorFromPhotoshopRGBA(r,g,b,a) [UIColor colorWithRed:PhotoshopColorValue(r) green:PhotoshopColorValue(g) blue:PhotoshopColorValue(b) alpha:a]

//################################################################################
#define UIColorFromPhotoshopHSBA(h,s,b,a) [UIColor colorWithHue:PhotoshopColorValue(h) saturation:PhotoshopColorValue(s) brightness:PhotoshopColorValue(b) alpha:a]

//################################################################################
#define UIColorFromHexValue(hex) UIColorFromPhotoshopRGBA(((hex & 0xFF0000) >> 16), ((hex & 0xFF00) >> 8), (hex & 0xFF), 1.0)
//################################################################################
