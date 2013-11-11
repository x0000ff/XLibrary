//
//  InstagramSharer.h
//  XLibrary
//
//  Created by Konstantin Portnov on 11/4/13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import <Foundation/Foundation.h>

//################################################################################
@interface InstagramSharer : NSObject

//################################################################################
+ (CGSize) instagramImageSize;

//################################################################################
//checks to see if user has instagram installed on device
+ (BOOL) isAppInstalled;

//################################################################################
//checks to see if image is large enough to be posted by instagram
//returns NO if image dimensions are under 612x612
//
//Technically the instagram allows for photos to be published under the size of 612x612
//BUT if you want nice quality pictures, I recommend checking the image size.
+ (BOOL) isImageCorrectSize:(UIImage*)image;

//################################################################################
//post image to instagram by passing in the target image and
//the view in which the user will be presented with the instagram model
+ (void) postImage:(UIImage *)image inView:(UIView *)view menuPresentedCallback:(void (^)())menuPresentedCallback
      dismissCallback:(void (^)())dismissCallback
   sendingCallback:(void (^)())sendingCallback
   successCallback:(void (^)())successCallback
      failCallback:(void (^)(NSError * error))failCallback;
;
//################################################################################
//Same as above method but with the option for a photo caption
+ (void) postImage:(UIImage *)image withCaption:(NSString *)caption inView:(UIView *)view menuPresentedCallback:(void (^)())menuPresentedCallback
   dismissCallback:(void (^)())dismissCallback
   sendingCallback:(void (^)())sendingCallback
   successCallback:(void (^)())successCallback
      failCallback:(void (^)(NSError * error))failCallback;

//################################################################################
@end
//################################################################################
