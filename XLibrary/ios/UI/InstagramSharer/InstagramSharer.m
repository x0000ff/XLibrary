//
//  InstagramSharer.m
//  XLibrary
//
//  Created by Konstantin Portnov on 11/4/13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import "InstagramSharer.h"
#import "UIImage+Resize.h"

//################################################################################
@interface InstagramSharer () <UIDocumentInteractionControllerDelegate>

@property (nonatomic, strong) UIDocumentInteractionController * documentInteractionController;
//@property (copy) void (^callback)(BOOL success, NSError * error);

@property (copy) void (^menuPresentedCallback)();
@property (copy) void (^dismissCallback)();
@property (copy) void (^sendingCallback)();
@property (copy) void (^successCallback)();
@property (copy) void (^failCallback)(NSError * error);

@property (nonatomic, assign) BOOL wasSending; // it needs for divide "dismiss" and "sendingToApp" -> "dismiss"

+ (instancetype) shared;

@end

//################################################################################
@implementation InstagramSharer

NSString * const kXInstagramAppURLString = @"instagram://app";
NSString * const kXInstagramPhotoFileName = @"tempinstgramphoto.igo";

//################################################################################
static CGFloat const kImageSize = 612;

//################################################################################
+ (instancetype)shared
{
    static InstagramSharer * _shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[InstagramSharer alloc] init];
    });
    
    return _shared;
}

//################################################################################
+ (CGSize) instagramImageSize
{
    return CGSizeMake(kImageSize, kImageSize);
}

//################################################################################
+ (BOOL) isAppInstalled
{
    NSURL *appURL = [NSURL URLWithString:kXInstagramAppURLString];

    return [[UIApplication sharedApplication] canOpenURL:appURL];
}

//################################################################################
//Technically the instagram allows for photos to be published under the size of 612x612
//BUT if you want nice quality pictures, I recommend checking the image size.
//################################################################################
+ (BOOL) isImageCorrectSize:(UIImage*)image
{
    CGImageRef cgImage = [image CGImage];
    return (CGImageGetWidth(cgImage) >= kImageSize && CGImageGetHeight(cgImage) >= kImageSize);
}

//################################################################################
+ (UIImage *) scaleAndResizeToCorrectSize:(UIImage *)image
{
    UIImage * resizedImage = image;

    if (![self.class isImageCorrectSize:image])
    {
        resizedImage = [image resizedImageWithContentMode:UIViewContentModeScaleAspectFill bounds:[self.class instagramImageSize] interpolationQuality:kCGInterpolationHigh];
    }
    
    return resizedImage;
}
//################################################################################
- (NSString*) photoFilePath
{
    NSArray  * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = [paths objectAtIndex:0]; // Get documents folder

    return [documentsDirectory stringByAppendingPathComponent:kXInstagramPhotoFileName];
}

//################################################################################
+ (void) postImage:(UIImage *)image inView:(UIView *)view menuPresentedCallback:(void (^)())menuPresentedCallback
   dismissCallback:(void (^)())dismissCallback
   sendingCallback:(void (^)())sendingCallback
   successCallback:(void (^)())successCallback
      failCallback:(void (^)(NSError * error))failCallback
{
    [[self shared] postImage:image withCaption:nil inView:view menuPresentedCallback:menuPresentedCallback dismissCallback:dismissCallback sendingCallback:sendingCallback successCallback:successCallback failCallback:failCallback];
}

//################################################################################
+ (void) postImage:(UIImage *)image withCaption:(NSString *)caption inView:(UIView *)view menuPresentedCallback:(void (^)())menuPresentedCallback
   dismissCallback:(void (^)())dismissCallback
   sendingCallback:(void (^)())sendingCallback
   successCallback:(void (^)())successCallback
      failCallback:(void (^)(NSError * error))failCallback
{
    [[self shared] postImage:image withCaption:caption inView:view menuPresentedCallback:menuPresentedCallback dismissCallback:dismissCallback sendingCallback:sendingCallback successCallback:successCallback failCallback:failCallback];
}

//################################################################################
- (void) postImage:(UIImage *)image withCaption:(NSString *)caption inView:(UIView *)view menuPresentedCallback:(void (^)())menuPresentedCallback
   dismissCallback:(void (^)())dismissCallback
   sendingCallback:(void (^)())sendingCallback
   successCallback:(void (^)())successCallback
      failCallback:(void (^)(NSError * error))failCallback
{
    NSError * deleteOldImageError = nil;
    [[NSFileManager defaultManager] removeItemAtPath:[self photoFilePath] error:&deleteOldImageError];
    if (deleteOldImageError)
    {
        NSLog(@"ERR while deleting old Image: %@", deleteOldImageError.localizedDescription);
    }

    self.wasSending = NO;

    self.menuPresentedCallback = menuPresentedCallback;
    self.dismissCallback = dismissCallback;
    self.sendingCallback = sendingCallback;
    self.successCallback = successCallback;
    self.failCallback = failCallback;

    if (!image)
    {
        if (self.failCallback)
        {
            NSString * errorDomain = NSStringFromClass(self.class);
            NSDictionary * errorDictionary = @{NSLocalizedDescriptionKey : @"Image can't be 'nil'"};
            NSError * error = [[NSError alloc] initWithDomain:errorDomain code:1 userInfo:errorDictionary];
            
            self.failCallback(error);
        }
    }
    
    UIImage * resizedImage = [self.class scaleAndResizeToCorrectSize:image];
    [UIImageJPEGRepresentation(resizedImage, 1.0) writeToFile:[self photoFilePath] atomically:YES];
    
    NSURL * fileURL = [NSURL fileURLWithPath:[self photoFilePath]];
    self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:fileURL];
    self.documentInteractionController.UTI = @"com.instagram.exclusivegram";
    self.documentInteractionController.delegate = self;
    
    if (caption)
    {
        self.documentInteractionController.annotation = [NSDictionary dictionaryWithObject:caption forKey:@"InstagramCaption"];
    }
    
    [self.documentInteractionController presentOpenInMenuFromRect:CGRectZero inView:view animated:YES];
}

//################################################################################
#pragma mark - UIDocumentInteractionControllerDelegate

//################################################################################
- (UIDocumentInteractionController *) setupControllerWithURL: (NSURL*) fileURL usingDelegate: (id <UIDocumentInteractionControllerDelegate>) interactionDelegate
{
    UIDocumentInteractionController * interactionController = [UIDocumentInteractionController interactionControllerWithURL: fileURL];
    interactionController.delegate = interactionDelegate;
    return interactionController;
}

//################################################################################
- (void)documentInteractionControllerWillPresentOpenInMenu:(UIDocumentInteractionController *)controller
{
    if (self.menuPresentedCallback)
    {
        self.menuPresentedCallback();
    }
}

//################################################################################
- (void)documentInteractionControllerDidDismissOpenInMenu:(UIDocumentInteractionController *)controller
{
    if (self.dismissCallback && !self.wasSending) self.dismissCallback();
}

//################################################################################
- (void)documentInteractionController:(UIDocumentInteractionController *)controller willBeginSendingToApplication:(NSString *)application
{
    self.wasSending = YES;
    if (self.sendingCallback) self.sendingCallback();
}

//################################################################################
- (void)documentInteractionController:(UIDocumentInteractionController *)controller didEndSendingToApplication:(NSString *)application
{
    if (self.successCallback) self.successCallback();
}

//################################################################################
@end
//################################################################################
