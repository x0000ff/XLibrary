//
//  NSObject+PerformBlockAfterDelay.h
//  TuInfoBolivia
//
//  Created by Konstantin Portnov on 17.10.13.
//  Copyright (c) 2013 Digevolabs. All rights reserved.
//

//################################################################################
#import <UIKit/UIKit.h>

//################################################################################
@interface NSObject (PerformBlockAfterDelay)

//################################################################################
- (void)performBlock:(void (^)(NSObject * blockOwner))block afterDelay:(NSTimeInterval)delayInSeconds;

//################################################################################
@end
//################################################################################
