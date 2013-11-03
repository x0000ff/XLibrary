//
//  ExtendNSLogFunctionality.h
//  XLibrary
//
//  Created by Konstantin Portnov on 16.10.13.
//  Copyright (c) 2013 Konstantin Portnov. All rights reserved.
//

//################################################################################
#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>
#ifdef DEBUG
#define NSLog(args...) ExtendNSLog(__FILE__,__LINE__,__PRETTY_FUNCTION__,args);
#else
#define NSLog(x...)
#endif

#define XLog(args...) ExtendNSLog(__FILE__,__LINE__,__PRETTY_FUNCTION__,args);

void ExtendNSLog(const char *file, int lineNumber, const char *functionName, NSString *format, ...);

//################################################################################
