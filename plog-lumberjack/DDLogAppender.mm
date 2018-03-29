//
//  DDLogAppender.mm
//  plog-lumberjack
//
//  Created by ilammy on 2018-03-30.
//  Copyright © 2018 ilammy. All rights reserved.
//

#include "DDLogAppender.h"

#import <CocoaLumberjack/CocoaLumberjack.h>

static DDLogLevel convert_log_level(plog::Severity severity)
{
    switch (severity)
    {
        case plog::none:
            return DDLogLevelOff;
        case plog::fatal:
            return DDLogLevelError;
        case plog::error:
            return DDLogLevelError;
        case plog::warning:
            return DDLogLevelWarning;
        case plog::info:
            return DDLogLevelInfo;
        case plog::debug:
            return DDLogLevelDebug;
        case plog::verbose:
            return DDLogLevelVerbose;
        default:
            return DDLogLevelOff;
    }
}

static DDLogFlag convert_log_flag(plog::Severity severity)
{
    switch (severity)
    {
        case plog::none:
            return 0;
        case plog::fatal:
            return DDLogFlagError;
        case plog::error:
            return DDLogFlagError;
        case plog::warning:
            return DDLogFlagWarning;
        case plog::info:
            return DDLogFlagInfo;
        case plog::debug:
            return DDLogFlagDebug;
        case plog::verbose:
            return DDLogFlagVerbose;
        default:
            return 0;
    }
}

static NSDate* convert_timestamp(const plog::util::Time &timestamp)
{
    double interval = (double) timestamp.time + (double) timestamp.millitm / 1000;

    return [NSDate dateWithTimeIntervalSince1970:interval];
}

void DDLogAppender::write(const plog::Record &record)
{
    DDLogMessage* message =
    [[DDLogMessage alloc] initWithMessage:[NSString stringWithUTF8String:record.getMessage()]
                                    level:convert_log_level(record.getSeverity())
                                     flag:convert_log_flag(record.getSeverity())
                                  context:0
                                     file:[NSString stringWithUTF8String:record.getFile()]
                                 function:[NSString stringWithUTF8String:record.getFunc()]
                                     line:record.getLine()
                                      tag:nil
                                  options:DDLogMessageCopyFile | DDLogMessageCopyFunction
                                timestamp:convert_timestamp(record.getTime())];

    [DDLog log:YES message:message];
}
