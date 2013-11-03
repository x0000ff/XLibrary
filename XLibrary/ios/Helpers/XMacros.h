//
//  XMacros.h
//
//  Created by x0000ff on 19.08.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 Useful macroses
 */

#define X_RELEASE_AND_NIL(__POINTER) { [__POINTER release]; __POINTER = nil; }

#define X_ASYNC_HIGH(...)       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{ __VA_ARGS__ })
#define X_ASYNC(...)            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{ __VA_ARGS__ })
#define X_ASYNC_BACKGROUND(...) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{ __VA_ARGS__ })
#define X_ASYNC_LOW(...)        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{ __VA_ARGS__ })

#define X_ASYNC_MAIN(...) dispatch_async(dispatch_get_main_queue(), ^{ __VA_ARGS__ })

//#define X_DEBUG // comment it if doesn't want to see debug messages with NWLog

//#define X_AWOO_VC_DEBUG // comment it if doesn't want to see debug messages with NWLog
#ifdef X_AWOO_VC_DEBUG
#define XAWLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define XAWLog(fmt, ...) //
#endif

#ifdef DEBUG
    #define dbug(format, ...) NSLog(format, ## _VA_ARGS_)
#else
    #define dbug(format, ...)
#endif

#ifdef DEBUG
#define LOG_NETWORK(level, ...)     LogMessageF(__FILE__,__LINE__,__FUNCTION__,@"network",level,__VA_ARGS__)
#define LOG_GENERAL(level, ...)     LogMessageF(__FILE__,__LINE__,__FUNCTION__,@"general",level,__VA_ARGS__)
#define LOG_GRAPHICS(level, ...)    LogMessageF(__FILE__,__LINE__,__FUNCTION__,@"graphics",level,__VA_ARGS__)
#else
#define LOG_NETWORK(...)    do{}while(0)
#define LOG_GENERAL(...)    do{}while(0)
#define LOG_GRAPHICS(...)   do{}while(0)
#endif