//
//  LoadingButton.m
//
//  Created by Konstantin Portnov on 27.10.13.
//  Copyright (c) 2013 Nico Arqueros. All rights reserved.
//

//################################################################################
#import "LoadingButton.h"
#import "UIView+Hierarchy.h"
#import "UIImage+XUtilities.h"

//################################################################################
@interface LoadingButton()

@property (nonatomic, strong) UIActivityIndicatorView * loader;
@property (nonatomic, strong) UIImage * originalImage;
@property (nonatomic, assign) BOOL wasUserInteractionEnabled;
@property (nonatomic, assign) BOOL wasEnabled;

@end

//################################################################################
@implementation LoadingButton

//################################################################################
- (void) showLoader
{
    [self showLoaderWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
}

//################################################################################
- (void) showLoaderWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style
{
    if (self.loader) return;
    
    UIButton * button = self;
    
    self.wasEnabled = self.enabled;
    self.wasUserInteractionEnabled = self.userInteractionEnabled;

    button.userInteractionEnabled = NO;
    button.enabled = NO;
    
    self.originalImage = self.currentImage;
    
    UIActivityIndicatorView * loader = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
    self.loader = loader;
    
    loader.hidesWhenStopped = NO;
    [loader startAnimating];
    [button addSubview:loader];
    
    // stub image for remove setted image
    UIColor * stubColor = [UIColor clearColor];
    CGSize size = loader.frame.size;
    
    // cuter inset
    size.width  *= 1.5;
    size.height *= 1.5;
    
    UIImage * stubImage = [UIImage imageWithColor:stubColor size:size];
    [button setImage:stubImage forState:UIControlStateNormal];
    
    // centersize
    CGRect rect = button.imageView.frame;
    CGPoint center = CGPointMake(
                                 rect.origin.x + rect.size.width/2,
                                 rect.origin.y + rect.size.height/2
                                 );
    [loader setCenter:center];
}

//################################################################################
- (void) hideLoader
{
    UIButton * button = self;
    
    button.enabled = self.wasEnabled;
    button.userInteractionEnabled = self.wasUserInteractionEnabled;

    UIImage * originalImage = self.originalImage;
    [button setImage:originalImage forState:UIControlStateNormal];
    self.originalImage = nil;
    
    [self.loader removeFromSuperview];
    self.loader = nil;
}

//################################################################################
@end
//################################################################################
