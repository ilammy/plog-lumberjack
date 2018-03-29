//
//  cpp-code.cpp
//  plog-lumberjack
//
//  Created by ilammy on 2018-03-30.
//  Copyright © 2018 ilammy. All rights reserved.
//

#include "cpp-code.hpp"

#include <plog/Log.h>
#include <plog/Appenders/ConsoleAppender.h>
#include <plog/Formatters/TxtFormatter.h>

void cpp_code_main()
{
    plog::init(plog::debug, new plog::ConsoleAppender<plog::TxtFormatter>());

    LOG_INFO << "Hello, plog!";
}
