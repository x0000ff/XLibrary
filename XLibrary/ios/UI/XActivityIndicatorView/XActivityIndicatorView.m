//
//  XIndicator.h
//  XLibrary
//
//  Created by Konstantin Portnov on 10.11.13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import "XActivityIndicatorView.h"
#import <QuartzCore/QuartzCore.h>

//################################################################################
@interface XActivityIndicatorView ()

//################################################################################
@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, copy) NSString * imageName;
@property (nonatomic, strong) CABasicAnimation * animation;

@end

//################################################################################
@implementation XActivityIndicatorView

//################################################################################
static NSTimeInterval kDefaultAnimationDuration = 2.0f; // in seconds

//################################################################################
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self _init];
    }
    
    return self;
}

//################################################################################
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self _init];
    }
    
    return self;
}

//################################################################################
- (id)initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style
{
    self = [super initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    if (self)
    {
        [self _init];
    }
    
    return self;
}

//################################################################################
-(id)initWithImage:(UIImage *)image
{
    self = [self initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    if(self)
    {
        self.image = image;
    }
    
    return self;
}

//################################################################################
- (void) setAnimationDuration:(NSTimeInterval)animationDuration
{
    _animationDuration = animationDuration;
    self.animation.duration = _animationDuration;
}
//################################################################################
- (void)_init
{
    self.animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    self.animation.fromValue = [NSNumber numberWithFloat:0.0f];
    self.animation.toValue = [NSNumber numberWithFloat: 2*M_PI];
    self.animation.repeatCount = HUGE_VAL;

    self.animationDuration = kDefaultAnimationDuration;

    self.fitFrame = YES;
}

//################################################################################
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if(self.imageName && !self.imageView)
    {
        self.image = [UIImage imageNamed:self.imageName];
    }
    else if(self.image && !self.imageView)
    {
        self.image = self.image;
    }
}

//################################################################################
-(void)setImage:(UIImage *)image
{
    _image = image;
    
    if(!self.frame.size.width)
    {
        return;
    }
    
    [self.imageView removeFromSuperview];
    self.imageView = nil;
    
    if(_image)
    {
        if(self.subviews.count)
        {
            [self.subviews[0] setHidden:YES];
        }
        
        self.imageView = [[UIImageView alloc] initWithImage:_image];
        
        self.fitFrame = self.fitFrame;
        
        if(self.hidesWhenStopped && !self.isAnimating)
        {
            self.imageView.hidden = YES;
        }
        
        [self addSubview:self.imageView];
        
        if(![self.imageView.layer animationForKey:@"animation"])
        {
            [self.imageView.layer addAnimation:self.animation forKey:@"animation"];
        }
    }
    else
    {
        if(self.subviews.count)
        {
            [self.subviews[0] setHidden:NO];
        }
    }
}

//################################################################################
-(void)setFitFrame:(BOOL)fitFrame
{
    _fitFrame = fitFrame;
    
    if(_fitFrame)
    {
        self.imageView.frame = self.bounds;
    }
    else
    {
        self.imageView.frame = (CGRect){(self.bounds.size.width - self.imageView.frame.size.width) / 2, (self.bounds.size.height - self.imageView.frame.size.height) / 2, self.imageView.frame.size};
    }
}

//################################################################################
-(void)setHidesWhenStopped:(BOOL)hidesWhenStopped
{
    [super setHidesWhenStopped:hidesWhenStopped];
    
    if(self.hidesWhenStopped && !self.isAnimating)
    {
        self.imageView.hidden = YES;
    }
    else
    {
        self.imageView.hidden = NO;
    }
}

//################################################################################
-(void)startAnimating
{
    [super startAnimating];
    
    self.imageView.hidden = NO;
    
    [self.imageView.layer addAnimation:self.animation forKey:@"animation"];
}

//################################################################################
-(void)stopAnimating
{
    [super stopAnimating];
    
    if(self.hidesWhenStopped)
    {
        self.imageView.hidden = YES;
    }
    
    [self.imageView.layer removeAllAnimations];
}

//################################################################################
@end
//################################################################################
