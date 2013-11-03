//
//  NSObject+PerformBlockAfterDelay.m
//  TuInfoBolivia
//
//  Created by Konstantin Portnov on 17.10.13.
//  Copyright (c) 2013 Digevolabs. All rights reserved.
//

//################################################################################
#import "NSObject+PerformBlockAfterDelay.h"

//################################################################################
@implementation NSObject (PerformBlockAfterDelay)

//################################################################################
- (void)performBlock:(void (^)(NSObject * blockOwner))block afterDelay:(NSTimeInterval)delayInSeconds
{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        block(self);
    });
}

//################################################################################
- (void)fireBlockAfterDelay:(void (^)(void))block {
    block();
}

//################################################################################
@end
//################################################################################
