//
//  DDLogAppender.h
//  plog-lumberjack
//
//  Created by ilammy on 2018-03-30.
//  Copyright © 2018 ilammy. All rights reserved.
//

#ifndef DDLogAppender_h
#define DDLogAppender_h

#include <plog/Appenders/IAppender.h>

class DDLogAppender : public plog::IAppender
{
public:
    //
    // "plog::IAppender" implementation
    //
    void write(const plog::Record &record) override;
};

#endif /* DDLogAppender_h */
