#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#define PLCRASH_FEATURE_MACH_EXCEPTIONS 1


FOUNDATION_EXPORT double SplunkOtelCrashReportingVersionNumber;
FOUNDATION_EXPORT const unsigned char SplunkOtelCrashReportingVersionString[];

